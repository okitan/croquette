require File.join(File.dirname(__FILE__), %w[ .. .. spec_helper])

describe Rack::Builder, '.croquette' do
  let(:klass)    { Rack::Builder }
  let(:instance) { klass.new }

  context '' do
    let(:block) { lambda {} }
    subject { instance.croquette(&block) }

    it '' do
      Croquette::Mincer.should_receive(:parse).and_yield(&block)
      subject
    end
  end
  
  context 'is called without block' do
    subject { instance.croquette }

    it { expect { subject }.to raise_exception }
  end
end

