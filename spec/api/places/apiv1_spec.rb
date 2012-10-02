require 'spec_helper'

module Places
  describe APIV1 do

    context "GET /api/place/:id" do

      let(:non_existent_place_id) { Moped::BSON::ObjectId.new }

      before do
        @eiffel_tower = Fabricate(:place)
      end

      it "should return a 200 status code in reponse" do
        get "/api/place/#{@eiffel_tower.id}"

        response.status.should eq 200
      end

      it "should return the name of the place in response body" do
        get "/api/place/#{@eiffel_tower.id}"

        json_response = response.body
        json_response.should be_json_eql({"name" => @eiffel_tower.name, "id" => @eiffel_tower.id}.to_json).
          excluding("categories", "photos","location","stats", "contact_info")
      end

      it "should return a 404 status code in response when place is not found" do
        get "/api/place/#{non_existent_place_id}"

        response.status.should eq 404
      end

      it "should return an error json when place is not found" do
        get "/api/place/#{non_existent_place_id}"

        response.body.should eq({:error => {:message => "We did not find what you were looking for", :code => 404}}.to_json)
      end

      context "for place with photos" do

        it "should include photos and their details for the place in response" do
          get "/api/place/#{@eiffel_tower.id}"

          json_response = response.body
          json_response.should have_json_size(1).at_path("photos")
          json_response.should have_json_type(String).at_path("photos/0/id")
          json_response.should have_json_type(String).at_path("photos/0/url")
          json_response.should have_json_type(String).at_path("photos/0/caption")
          json_response.should have_json_type(String).at_path("photos/0/type")
        end

      end

      context "for place with location" do

        it "should include location details for the place in response" do
          get "/api/place/#{@eiffel_tower.id}"

          json_response = response.body
          json_response.should have_json_type(Float).at_path("location/latitude")
          json_response.should have_json_type(Float).at_path("location/longitude")
        end

      end

      context "for place with stat group" do
        
        it "should include the stats from stat group details of the place in response" do
          get "/api/place/#{@eiffel_tower.id}"

          json_response = response.body
          json_response.should have_json_type(Integer).at_path("stats/likes")
          json_response.should have_json_type(Integer).at_path("stats/dislikes")
        end

      end

      context "for place with contact info" do
      
        it "should include the contact info details in the response" do
          get "/api/place/#{@eiffel_tower.id}"

          json_response = response.body
          json_response.should have_json_type(String).at_path("contact_info/address_line_1")
          json_response.should have_json_type(String).at_path("contact_info/address_line_2")
          json_response.should have_json_type(NilClass).at_path("contact_info/address_line_3")
          json_response.should have_json_type(String).at_path("contact_info/city")
          json_response.should have_json_type(String).at_path("contact_info/country")
          json_response.should have_json_type(String).at_path("contact_info/zipcode")
          json_response.should have_json_type(NilClass).at_path("contact_info/state")
        end

      end

      context "for place with associated categories" do
        
        it "should include the categories for the place in response" do
          get "/api/place/#{@eiffel_tower.id}"

          json_response = response.body
          json_response.should have_json_size(1).at_path("categories/")
          json_response.should have_json_type(String).at_path("categories/0/name")
        end

      end

    end

  end

end
