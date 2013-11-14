class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(*params[:session].values)
    #error code for user.nil?
    user.reset_session_token!
    session[:session_token] = user.session_token
    redirect_to cats_url
  end

  def destroy #logging out
    self.current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to cats_url
  end

end
