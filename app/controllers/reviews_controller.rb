class ReviewsController < ApplicationController
  before_action :set_reviews, only: [:edit, :update, :show, :destroy]



  def new
    @reviews = Review.new
  end

  def show
    @reviews_vid = Review.find(params[:vendor_id])
    @id = @reviews.id
    @vid = @reviews.vendor_id
  end

  def edit

  end

  def index
    @reviews = Review.all
  end

  def set_reviews
    @reviews = Review.find(params[:id])
  end

  def destroy
    @reviews.destroy
    flash[:notice] = "Review was deleted"
    redirect_to vendor_path(@reviews.vendor_id)
  end

  def update
    if @reviews.update(reviews_params)
      flash[:notice] = "Review was updated"
      redirect_to vendor_path(@reviews.vendor_id)
    else
      flash[:alert] = "review was not updated"
      render 'edit'
    end
  end

  def create
    #render plain: params[:article].inspect
    @reviews = Review.new(reviews_params)
    @reviews.save
    if @reviews.save
      flash[:notice] = "Review was successfully created"
      redirect_to vendor_path(@reviews.vendor_id)
    else
      flash[:alert] = "ERROR: Could not create review"
      render 'new'
    end

  end



  private
  def reviews_params
    params.require(:review).permit(:description,:vendor_id, :user_id, :rating)
  end
end