require 'spec_helper'

describe Stats do

  context "types" do
    it { should respond_to :likes         }
    it { should respond_to :dislikes      }
  end

end
