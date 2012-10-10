require 'spec_helper'

describe InviteController do
  
  context "GET /invite/new" do
    context "for a logged out user" do

      it "should render the beta invitation page" do
        get :new

        response.should render_template("invite/new")
      end

      it "should return a success response" do
        get :new

        response.status.should eq 200
      end

    end
  end

  context "POST /invite" do
    context "for a logged out user" do

      let(:params_to_send) { params_to_send = {:invite => { :email => "murphy@mailinator.com" }} }
      
      it "returns a success reponse" do
        post :create, params_to_send

        response.status.should eq 200
      end

      it "render nothing" do
        post :create, params_to_send

        response.body.should be_blank
      end

      it "create an invite" do
        post :create, params_to_send

        response.status.should eq 200
        Invite.where(:email => "murphy@mailinator.com").first.should be_present
      end

    end
  end


end
