require 'spec_helper'

describe Itinerary do

  context "attributes" do
    it { should respond_to :stopovers   }
    it { should respond_to :name        }
    it { should respond_to :description }
  end

  context "stopovers" do

    let(:eiffel_tower_stopover) { Fabricate.build(:eiffel_tower_stopover) }
    let(:hilton_hotel_stopover) { Fabricate.build(:hilton_hotel_stopover) }

    before do
      @trip_to_paris = Fabricate(:itinerary, :stopovers => [])
      @trip_to_paris.stopovers << eiffel_tower_stopover
      @trip_to_paris.stopovers << hilton_hotel_stopover
    end

    it "should assign and persist stopovers against itinerary" do
      Itinerary.find(@trip_to_paris.id).stopovers.size.should eq 2
    end

    it "should maintain the order of insertion under an itinerary" do
      stopovers = Itinerary.find(@trip_to_paris.id).stopovers

      stopovers.first.should eq eiffel_tower_stopover
      stopovers.last.should eq hilton_hotel_stopover
    end

  end

end
