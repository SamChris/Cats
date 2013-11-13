class CatRentalRequestsController < ApplicationController
  def new
    #@cat_rental_request = CatRentalRequest.new
    render :new
  end

  def create
    cat = CatRentalRequest.new(params[:cat_rental_request])
    if cat.save
      redirect_to cats_url
    else
      render :json => cat.errors, :status => :unprocessable_entity
    end
  end

  def approve
    cat = CatRentalRequest.find_by_id(params[:id])
    cat.approve!
    redirect_to cats_url
  end

  def deny
    cat = CatRentalRequest.find_by_id(params[:id])
    cat.deny!
    redirect_to cats_url
  end


end
