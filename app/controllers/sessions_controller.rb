class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(*params[:session].values)
    if !user
      flash[:error] = "Your credentials are invalid!"
      redirect_to new_session_url
    else
      session_h = SessionHolder.new(user_id: user.id, session_token: user.session_token, environment: request.env["HTTP_USER_AGENT"])

      #error code for user.nil?
      #user.reset_session_token!
      if session_h.save
        session[:session_token] = user.session_token
        redirect_to cats_url
      else
        #errors
      end
    end
  end

  def destroy #logging out
    u = self.current_user


    sess = SessionHolder.find_by_user_id_and_session_token(u.id, u.session_token)
    sess.destroy
    session[:session_token] = nil
    redirect_to cats_url
  end

end
