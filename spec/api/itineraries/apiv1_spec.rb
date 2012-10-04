require 'spec_helper'

module Itineraries
  describe APIV1 do
    
    context "GET /api/itinerary/:id" do
      
      let(:non_existent_itinerary_id) { Moped::BSON::ObjectId.new }

      before do
        @itinerary_to_kerela = Fabricate(:itinerary)
      end

      it "should return a 200 status code in reponse for valid itinerary" do
        pending "Itinerary model hasn't been implemented as yet"
        get "/api/itinerary/#{@itinerary_to_kerela.id}"

        response.status.should eq 200
      end

      it "should return the detail of the itinerary in response body" do
        pending "Itinerary model hasn't been implemented as yet"
        get "/api/itinerary/#{@itinerary_to_kerela.id}"

        json_response = response.body
        itinerary_details_as_json = %()
        json_response.should be_json_eql(itinerary_details_as_json)
      end

      it "should return a 404 status code in response when itinerary is not found" do
        pending "Itinerary model hasn't been implemented as yet"
        get "/api/itinerary/#{non_existent_itinerary_id}"

        response.status.should eq 404
      end

      it "should return an error json when itinerary is not found" do
        pending "Itinerary model hasn't been implemented as yet"
        get "/api/itinerary/#{non_existent_itinerary_id}"

        response.body.should eq({:error => {:message => "We did not find what you were looking for", :code => 404}}.to_json)
      end

    end

  end
end
