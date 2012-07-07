require 'spec_helper'

describe HomeController do

  context "GET to index" do

    context "for a logged out user" do
      it "should force a to authenticate" do
        get :index

        response.should redirect_to("http://test.host/users/sign_in")
      end
    end

    context "for a logged out user" do

      before do
        user = User.create!(:email => "user@fakeemail.com", :password => "p@ssw0rd", :confirmed_at => Date.today)
        sign_in user
      end

      it "should render index page" do
        get :index

        response.should be_success
        response.should render_template('home/index')
        response.should_not redirect_to("http://test.host/users/sign_in")
      end
    end

  end

end
