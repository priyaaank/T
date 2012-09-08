require 'spec_helper'

describe Location do

  context "attributes" do
    it { should respond_to :latitude  }
    it { should respond_to :longitude }
  end

end
