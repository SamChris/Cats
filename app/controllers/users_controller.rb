class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    u =User.new(params[:user])
    if u.save
      #redirect_to session_url
      self.current_user=(u)
      redirect_to cats_url
    else
      render :json => u.errors, :status => :unprocessable_entity
    end
  end
end
