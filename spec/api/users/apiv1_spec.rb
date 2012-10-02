require 'spec_helper'

module Users
  describe APIV1 do
    
    context "GET /api/user/:id" do

      let(:non_existent_user_id) { Moped::BSON::ObjectId.new }

      before do
        @greg_house = Fabricate(:user, :email => "gregory_house@mailinator.com")
      end

      it "should return a 200 status code in reponse for valid user" do
        get "/api/user/#{@greg_house.id}"

        response.status.should eq 200
      end

      it "should return the detail of the user in response body" do
        get "/api/user/#{@greg_house.id}"

        json_response = response.body
        user_details_as_json = %({"first_name" : "#{@greg_house.first_name}", "last_name" : "#{@greg_house.last_name}", "email" : "#{@greg_house.email}"})
        json_response.should be_json_eql(user_details_as_json)
      end

      it "should return a 404 status code in response when place is not found" do
        get "/api/user/#{non_existent_user_id}"

        response.status.should eq 404
      end

      it "should return an error json when place is not found" do
        get "/api/user/#{non_existent_user_id}"

        response.body.should eq({:error => {:message => "We did not find what you were looking for", :code => 404}}.to_json)
      end

    end
  end
end
