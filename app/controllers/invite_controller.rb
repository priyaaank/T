class InviteController < ApplicationController

  skip_filter :authenticate_user!

  def create
    invitation_request = Invite.new(:email => params[:invite][:email])
    invitation_request.save! if invitation_request.valid?
    render :text => "", :head => :ok
  end

end
