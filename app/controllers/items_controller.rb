class ItemsController < ApplicationController

  def index
  end

  def new
  end

  def show
    @item = Item.find_by(id:params[:id])
    @images = @item.item_images
    @comments = @item.item_comments
  end

  def buy
  end

end
