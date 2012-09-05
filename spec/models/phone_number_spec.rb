require 'spec_helper'

describe PhoneNumber do
  
  context "attributes" do
    it { should respond_to :country_code }
    it { should respond_to :area_code    }
    it { should respond_to :number       }
  end

  context "representation as text" do

    let(:indian_phone_number) { PhoneNumber.new(:country_code => "91", :area_code => "020", :number => "2334567") } 
    let(:phone_for_unknown_country) { PhoneNumber.new(:area_code => "020", :number => "2334567")  }

    it "should be formatted in +<country_code> <area_code> <number> format" do
      indian_phone_number.formatted_phone_number.should eq "+91 020 2334567"
    end

    it "should not append + sign if country code is not present" do
      phone_for_unknown_country.formatted_phone_number.should eq "020 2334567"
    end

  end

end
