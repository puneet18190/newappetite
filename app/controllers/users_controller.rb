class UsersController < ApplicationController
  before_action :set_user, :add_email, :except => :update_invite_user_status

  def update_invite_user_status
    @user = User.find(params[:user_id])
    @user.update_attribute('invite_user',params[:status])
    UserMailer.invite_user(@user).deliver if @user.invite_user == true
    render :json => {:status => "ok"}.to_json
  end

  def add_email
    if params[:user] && params[:user][:email]
      current_user.email = params[:user][:email]
      current_user.skip_reconfirmation! # don't forget this if using Devise confirmable
      respond_to do |format|
        if current_user.save
          format.html { redirect_to current_user, notice: 'Your email address was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { @show_errors = true }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

end
