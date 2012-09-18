require 'spec_helper'

describe Photo do

  context "attributes" do
    it { should respond_to :url     }
    it { should respond_to :type    }
    it { should respond_to :caption }
    it { should respond_to :destination }
  end

end
