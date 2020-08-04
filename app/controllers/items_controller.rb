class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item), notice: "Item successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.updte(item_params)
      redirect_to @item, notice: "Item successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: "Item successfully destroyed."
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :price, :description, :category, :address)
  end
end
