class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by_id(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    cat = Cat.new(params[:cat])
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
