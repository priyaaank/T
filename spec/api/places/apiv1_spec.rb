require 'spec_helper'

module Places
  describe APIV1 do

    context "GET /api/place/:id" do

      let(:non_existent_place_id) { Moped::BSON::ObjectId.new }

      before do
        @delightful_cafe = Place.create!(:name => "Delightful Cafe")
      end

      it "should return a 200 status code in reponse" do
        get "/api/place/#{@delightful_cafe.id}"

        response.status.should eq 200
      end

      it "should return the name of the place in response body" do
        get "/api/place/#{@delightful_cafe.id}"

        response.body.should eq({:name => "Delightful Cafe"}.to_json)
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
