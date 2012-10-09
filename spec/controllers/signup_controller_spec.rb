require 'spec_helper'

describe SignupController do
  
  context "GET /index" do
    context "for a logged out user" do

      it "should render the beta sign up page" do
        get :index

        response.should render_template("signup/index")
      end

      it "should return a success response" do
        get :index

        response.status.should eq 200
      end

    end
  end


end
