require File.join(File.dirname(__FILE__), %w[ .. spec_helper ])

describe Croquette::Masher, '.mash' do
  let(:klass) { Croquette::Masher }

  subject { klass.mash(&block) }
  
  context '' do
    let(:block) { lambda { hoge 'date' } }
    
    it 'should return subclass of it' do
      subject.should be_kind_of(klass)
    end
    
    it 'should responde_to hoge' do
      subject.should respond_to(:hoge)
    end
    
    it 'should execute 1st attribute' do
      subject.hoge.should == %x(date).chomp
    end
  end

  context 'if redirect_to is set' do
    let(:block) { lambda { hoge 'date', :redirect_to => '/path/to' } }

    it { expect { subject.hoge }.to raise_exception(Croquette::Redirect, '/path/to') }
  end
end

describe Croquette::Mincer, '.mince' do
  let(:klass) { Croquette::Mincer }
  
  subject { klass.mince(&block) }
  let(:block) { lambda {} }
  
  it 'should instantiate and mince' do
    klass.should_receive(:new).and_return(masher = mock('instance'))
    masher.should_receive(:mince).and_yield(&block)
    
    subject
  end
end

describe Croquette::Mincer, '#mince' do
  let(:klass)    { Croquette::Mincer }
  let(:instance) { klass.new }

  subject { instance.mince(&block) }

  context '' do
    let(:block) { lambda {} }
    
    it 'should eval with scope of instance and return @mince' do
      instance.should_receive(:instance_eval).and_yield(&block)
      
      subject.should == instance.instance_variable_get(:@mince)
    end
  end

  context 'is called with lambda' do
    context 'which call unknown function with extra block' do
      let(:block) { lambda { hoge {} } }
      
      it 'should call Masher.new' do
        Croquette::Masher.should_receive(:new).and_yield(block)
        
        subject
      end
      
      it 'should return Hash which has key of function name' do
        subject.should have_key(:hoge)
      end

    end

    context 'which call unknown function has no block' do
      let(:block) { lambda { hoge } }

      it 'should not call Masher.new' do
        Croquette::Masher.should_not_receive(:new)

        subject
      end
      
      it 'should not return the key' do
        subject.should_not have_key(:hoge)
      end
    end
  end
end
