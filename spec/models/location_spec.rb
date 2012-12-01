require 'spec_helper'

describe Location do

  context "attributes" do
    it { should respond_to :cordinates  }
    it { should respond_to :latitude  }
    it { should respond_to :longitude }
  end

  context "geographical cordinates" do
    let(:location) { Fabricate.build(:location) }

    it "should have latitude" do
      location.latitude.should eq 48.858165
    end

    it "should have longitude" do
      location.longitude.should eq 2.295354
    end

  end

end
