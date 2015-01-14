class AuthController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    #and so on for session
  end

  def delete
    session[:user_id] = nil
  end
end
