require 'spec_helper'

describe Itinerary do

  context "attributes" do
    it { should respond_to :stopovers   }
    it { should respond_to :name        }
    it { should respond_to :description }
  end

end
