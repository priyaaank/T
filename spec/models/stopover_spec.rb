require 'spec_helper'

describe Stopover do

  context "attributes" do
    
    subject { Fabricate.build(:stopover)           }

    it { should respond_to :point_of_interest_type }
    it { should respond_to :name                   }
    it { should respond_to :description            }
    it { should respond_to :node_order             }
    it { should respond_to :point_of_interest      }
  end

  context "association with place as point of interest" do

    before do
      @eiffel_tower = Fabricate(:place)
      @stopover = Fabricate.build(:stopover, 
                                  :point_of_interest => @eiffel_tower,
                                  :name => "Eiffel Tower",
                                  :description => "Lunch at Eiffel Tower"
                                 )
      itinerary = Fabricate(:itinerary, :stopovers => [@stopover])
    end

    it "should set component to be place id once initialized" do
      @stopover.point_of_interest.should eq @eiffel_tower.id
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

    it "should return the node order value when requested" do
      @stopover.node_order.should eq 1
    end

  end

end
