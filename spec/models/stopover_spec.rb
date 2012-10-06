require 'spec_helper'

describe Stopover do

  context "attributes" do
    
    subject { Fabricate.build(:stopover)           }

    it { should respond_to :point_of_interest_type     }
    it { should respond_to :name                       }
    it { should respond_to :description                }
    it { should respond_to :point_of_interest_id       }
    it { should respond_to :point_of_interest_details  }
  end

  context "association with place as point of interest" do

    before do
      @eiffel_tower = Fabricate(:place)
      @stopover = Stopover.at(@eiffel_tower,"Eiffel Tower","Lunch at Eiffel Tower")
      itinerary = Fabricate(:itinerary, :stopovers => [@stopover])
    end

    it "should initialize the point of interest type to that of the point of interest passed" do
      @stopover.point_of_interest_type.should eq "Place"
    end

    it "should initialize the point of interest id with the id of point of interest passed" do
      @stopover.point_of_interest_id.should eq @eiffel_tower.id
    end

    it "should return a place as a point of interest details when requested" do
      @stopover.point_of_interest_details.should eq @eiffel_tower
    end

    it "should return 'Place' as the point of interest type" do
      @stopover.point_of_interest_type.should eq "Place"
    end

    it "should return name assigned to the node" do
      @stopover.name.should eq "Eiffel Tower"
    end

    it "should return the description assigned to the node" do
      @stopover.description.should eq "Lunch at Eiffel Tower"
    end

  end

end
