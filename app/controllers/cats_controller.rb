class CatsController < ApplicationController
  before_filter :authorize, :only => [:edit, :update]

  def authorize
    unless current_user.id == Cat.find_by_id(params[:id]).user_id
      flash[:error] = "You do not own this cat!"
      redirect_to cats_url
    end
  end

  def index
    @cats = Cat.all

    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    cat = Cat.new(params[:cat])
    u = current_user
    cat.update_attribute(:user_id, u.id)
    if cat.save
      redirect_to cats_url
    else
      render :json => cat.errors, :status => :unprocessable_entity
    end
  end

  def edit
    @cat = Cat.find_by_id(params[:id])
    render :edit
  end

  def update
    cat = Cat.find_by_id(params[:id])

    cat.update_attributes(params[:cat])

    if cat.save
      redirect_to cats_url
    else
      render :json => cat.errors, :status => :unprocessable_entity
    end
  end

end
