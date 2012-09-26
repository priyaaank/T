require 'spec_helper'

describe StatGroup do

  context "types" do
    it { should respond_to :likes         }
    it { should respond_to :dislikes      }
  end

end
