require 'spec_helper'

module Itineraries
  describe APIV1 do
    
    context "GET /api/itinerary/:id" do
      
      let(:non_existent_itinerary_id) { Moped::BSON::ObjectId.new }
      let(:eiffel_tower_stopover) { Fabricate.build(:eiffel_tower_stopover) }
      let(:hilton_hotel_stopover) { Fabricate.build(:hilton_hotel_stopover) }

      before do
        @itinerary_to_paris = Fabricate(:itinerary, :stopovers => [eiffel_tower_stopover, hilton_hotel_stopover])
      end

      it "should return a 200 status code in reponse for valid itinerary" do
        get "/api/itinerary/#{@itinerary_to_paris.id}"

        response.status.should eq 200
      end

      it "should return the detail of the itinerary in response body" do
        get "/api/itinerary/#{@itinerary_to_paris.id}"

        json_response = response.body
        itinerary_details_as_json = %({"name" : "Trip to Paris", "description" : "Winter trip with family to somewhere nice"})
        json_response.should be_json_eql(itinerary_details_as_json).excluding("stopovers")
      end

      context "place as point of interest" do

        it "should include photos and their details for the place in response" do
          get "/api/itinerary/#{@itinerary_to_paris.id}"

          json_response = response.body
          json_response.should have_json_type(String).at_path("stopovers/0/point_of_interest/photos/0/url")
          json_response.should have_json_type(String).at_path("stopovers/0/point_of_interest/photos/0/caption")
          json_response.should have_json_type(String).at_path("stopovers/0/point_of_interest/photos/0/type")
        end

        it "should include location details for the point of interest in response" do
          get "/api/itinerary/#{@itinerary_to_paris.id}"

          json_response = response.body
          json_response.should have_json_type(Float).at_path("stopovers/0/point_of_interest/location/latitude")
          json_response.should have_json_type(Float).at_path("stopovers/0/point_of_interest/location/longitude")
        end

        it "should include the stats from stat group details of the place in response" do
          get "/api/itinerary/#{@itinerary_to_paris.id}"

          json_response = response.body
          json_response.should have_json_type(Integer).at_path("stopovers/0/point_of_interest/stat_group/likes")
          json_response.should have_json_type(Integer).at_path("stopovers/0/point_of_interest/stat_group/dislikes")
        end

      end

      it "should return all the stopovers in the response body" do
        get "/api/itinerary/#{@itinerary_to_paris.id}"

        json_response = response.body
        json_response.should have_json_size(2).at_path("stopovers")
      end

      it "should return complete stopover detail in the response body" do
        get "/api/itinerary/#{@itinerary_to_paris.id}"

        json_response = response.body
        json_response.should have_json_size(2).at_path("stopovers")
      end

      it "should return a 404 status code in response when itinerary is not found" do
        get "/api/itinerary/#{non_existent_itinerary_id}"

        response.status.should eq 404
      end

      it "should return an error json when itinerary is not found" do
        get "/api/itinerary/#{non_existent_itinerary_id}"

        response.body.should eq({:error => {:message => "We did not find what you were looking for", :code => 404}}.to_json)
      end

    end

  end
end
