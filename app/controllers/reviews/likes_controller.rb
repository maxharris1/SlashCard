class Reviews::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review

  def create
    @review.likes.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html { redirect_to @review }
      format.js
    end
  end

  def destroy
    @review.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_to @review }
      format.js
    end
  end

  private

  def set_review
    @review = Review.find(params[:review_id])
  end
end