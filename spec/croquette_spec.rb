require File.join(File.dirname(__FILE__), 'spec_helper')

describe Croquette do
  subject { Croquette::VERSION }

  it { should == '0.0.0' }
end
