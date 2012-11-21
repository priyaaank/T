class MocksController < ApplicationController

  skip_filter :authenticate_user!

  def home
    render :home
  end

end
