class CatRentalRequestsController < ApplicationController 
 
  def new 
    @cat_rental = CatRentalRequest.new
    @cats = Cat.all 
    render :new
  end

  def create 
    @cat_rental = CatRentalRequest.new(cat_rental_params)

    if @cat_rental.save
      redirect_to cat_url(@cat_rental.cat_id) 
    else 
      render :new
    end 
  end 

  def approve 
    current_cat_rental_request.approved!
    redirect_to cat_url(current_cat) 
  end 

  def deny 
    current_cat_rental_request.deny!
    redirect_to cat_url(current_cat) 
  end 

  private 
  def current_cat_rental_request
    @rental_request ||= 
      CatRentalRequest.includes(:cat).find(params[:id])
  end 

  def current_cat
    current_cat_rental_request.cat
  end 

  def cat_rental_params 
   params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end 
end 
