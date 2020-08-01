class ItemsController < ApplicationController
  def index
    @items = Items.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render 'new'
    end
  end

  private

  def items_params
    params.require(:item).permit(:title, :price, :description, :category)
  end
end
