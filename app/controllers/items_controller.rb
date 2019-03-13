class ItemsController < ApplicationController

  def index
    @pick_up_categories = Category.where(pick_up:1)
    @pick_up_blands = Brand.where(pick_up:1)
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.item_images
    @comment = ItemComment.new
    @comments = @item.item_comments
  end

  def buy
  end

end
