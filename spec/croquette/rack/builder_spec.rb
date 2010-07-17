require File.join(File.dirname(__FILE__), %w[ .. .. spec_helper])

describe Rack::Builder, '.fry' do
  let(:klass)    { Rack::Builder }
  let(:instance) { klass.new }

  context 'is called with block' do
    let(:block) { lambda {} }
    subject { instance.fry(&block) }

    it 'should mince block and return Array' do
      Croquette::Mincer.should_receive(:mince).and_yield(&block).and_return([])
      
      subject
    end

    context '' do
      let(:app) {  }
      before do
        Croquette::Mincer.stub(:mince).and_return([ app ])
      end

      it 'should create mapping of app' do
        instance.should_receive(:map).and_yield
        instance.should_receive(:run).with(app)

        subject
      end
    end
  end
  
  context 'is called without block' do
    subject { instance.fry }

    it { expect { subject }.to raise_exception }
  end
end
