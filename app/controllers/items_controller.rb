class ItemsController < ApplicationController
  def index
    @items = Items.all
  end

  def new
    @item = Item.new
  end

  def create
     @item = Item.new(items_params)
     @item.save
    redirect_to item_path(@item)
  end

  private

  def items_params
    params.require(:item).permit(:title, :price, :description, :category)
  end
end
