require File.join(File.dirname(__FILE__), %w[ .. spec_helper ])

describe Croquette::Mincer, '.parse' do
  let(:klass) { Croquette::Mincer }
  
  subject { klass.parse(&block) }
  let(:block) { lambda {} }
  
  it 'should instantiate and parse' do
    klass.should_receive(:new).and_return(masher = mock('instance'))
    masher.should_receive(:parse).and_yield(&block)
    
    subject
  end
end

describe Croquette::Mincer, '#parse' do
  let(:klass)    { Croquette::Mincer }
  let(:instance) { klass.new }

  subject { instance.parse(&block) }
  let(:block) { lambda {} }

  it 'should eval with scope of instance' do
    instance.should_receive(:instance_eval).and_yield(&block)

    subject
  end
  
end
