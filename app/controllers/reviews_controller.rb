class ReviewsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @item = Item.find(params[:item_id])
    @review.item = @item
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to item_path(@review.item)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
