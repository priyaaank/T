require 'spec_helper'

describe Category do

  context "attributes" do
    it { should respond_to :name }
    it { should respond_to :identifier }
  end

  context "identifier" do
    it "should be lowercased always" do
      monument_category = Fabricate(:category, :name=>"Monument", :identifier => "Monument")

      Category.find(monument_category.id).identifier.should eq "monument"
    end

    it "should be auto assigned as lowercased undescorized version of name" do
      monument_category = Fabricate(:category, :name=>"Nightlife Place", :identifier => nil)

      Category.find(monument_category.id).identifier.should eq "nightlife_place"
    end

    it "should merely downcase the identifier if present" do
      monument_category = Fabricate(:category, :name=>"Nightlife Place", :identifier => "Nightlife_For_Win")

      Category.find(monument_category.id).identifier.should eq "nightlife_for_win"
    end

    it "should remove any spaces from identifier" do
      monument_category = Fabricate(:category, :identifier => "Nightlife For Win")

      Category.find(monument_category.id).identifier.should eq "nightlife_for_win"
    end
  end

end
