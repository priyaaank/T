require 'spec_helper'

describe Tip do

  context "attributes" do
    it { should respond_to :text        }
    it { should respond_to :destination }
    it { should respond_to :user        }
  end

end
