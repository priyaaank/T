require 'spec_helper'

module Reviews
  describe APIV1 do

    context "GET /api/review/:id" do

      let(:non_existent_review_id) { Moped::BSON::ObjectId.new }

      before do
        @review_of_eiffel_tower = Fabricate(:review)
      end

      it "should return a 200 status code in reponse for valid review" do
        get "/api/review/#{@review_of_eiffel_tower.id}"

        response.status.should eq 200
      end

      it "should return the detail of the review in response body" do
        get "/api/review/#{@review_of_eiffel_tower.id}"

        json_response = response.body
        review_details_as_json = %({"text" : "#{@review_of_eiffel_tower.text}", 
                                    "rating" : #{@review_of_eiffel_tower.rating_value}, 
                                    "review_datetime" : "#{@review_of_eiffel_tower.review_date}"})
        json_response.should be_json_eql(review_details_as_json)
      end

      it "should return a 404 status code in response when review is not found" do
        get "/api/review/#{non_existent_review_id}"

        response.status.should eq 404
      end

      it "should return an error json when review is not found" do
        get "/api/review/#{non_existent_review_id}"

        response.body.should eq({:error => {:message => "We did not find what you were looking for", :code => 404}}.to_json)
      end

    end
  end
end
