require 'spec_helper'

describe ContactInfo do


  context "attributes" do
    it { should respond_to :address_line_1 }
    it { should respond_to :address_line_2 }
    it { should respond_to :address_line_3 }
    it { should respond_to :city }
    it { should respond_to :country }
    it { should respond_to :state }
    it { should respond_to :zipcode }
    it { should respond_to :phone_numbers }
    it { should respond_to :contactable }
  end

end
