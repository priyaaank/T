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
        json_response.should be_json_eql({"name" => @eiffel_tower.name, "id" => @eiffel_tower.id}.to_json).excluding("photos")
      end

      it "should include photos for the place for the response body" do
        get "/api/place/#{@eiffel_tower.id}"

        json_response = response.body
        json_response.should have_json_size(1).at_path("photos")
        json_response.should have_json_type(String).at_path("photos/0/id")
        json_response.should have_json_type(String).at_path("photos/0/url")
        json_response.should have_json_type(String).at_path("photos/0/caption")
        json_response.should have_json_type(String).at_path("photos/0/type")
      end

      it "should return a 404 status code in response when place is not found" do
        get "/api/place/#{non_existent_place_id}"

        response.status.should eq 404
      end

      it "should return an error json when place is not found" do
        get "/api/place/#{non_existent_place_id}"

        response.body.should eq({:error => {:message => "We did not find what you were looking for", :code => 404}}.to_json)
      end

    end

  end

end
