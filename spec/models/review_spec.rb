require 'spec_helper'

describe Review do

  context "attributes" do
    it { should respond_to :text         }
    it { should respond_to :reviewer     }
    it { should respond_to :rating_value }
    it { should respond_to :review_date  }
    it { should respond_to :destination  }
  end

end
