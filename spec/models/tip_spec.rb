require 'spec_helper'

describe Tip do

  context "attributes" do
    it { should respond_to :text        }
    it { should respond_to :point_of_interest }
    it { should respond_to :user        }
  end

end
