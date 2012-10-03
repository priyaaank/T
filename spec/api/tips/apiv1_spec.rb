require 'spec_helper'

module Tips
  describe APIV1 do
    
    context "GET /api/tip/:id" do

      let(:non_existent_tip_id) { Moped::BSON::ObjectId.new }

      before do
        @tip_on_eiffel_tower = Fabricate(:tip)
      end

      it "should return a 200 status code in reponse for valid tip" do
        get "/api/tip/#{@tip_on_eiffel_tower.id}"

        response.status.should eq 200
      end

      it "should return the detail of the tip in response body" do
        get "/api/tip/#{@tip_on_eiffel_tower.id}"

        json_response = response.body
        tip_details_as_json = %({"text" : "#{@tip_on_eiffel_tower.text}"})
        json_response.should be_json_eql(tip_details_as_json)
      end

      it "should return a 404 status code in response when tip is not found" do
        get "/api/tip/#{non_existent_tip_id}"

        response.status.should eq 404
      end

      it "should return an error json when tip is not found" do
        get "/api/tip/#{non_existent_tip_id}"

        response.body.should eq({:error => {:message => "We did not find what you were looking for", :code => 404}}.to_json)
      end

    end

  end
end
