class MainController < ApplicationController
  before_filter :authenticate_user!

  def index
    redirect_to root_url, :flash => { :alert => "You are not Invited User" } if current_user.invite_user == false
  end
end
