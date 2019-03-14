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
    @vendor_items = Item.where.not(id:params[:id]).where(vendor_id:@item.vendor_id).order(id: :DESC).limit(6)
    @brand_items = Item.where.not(id:params[:id]).where(brand:@item.brand).order(id: :DESC).limit(6)
  end

  def buy
  end

end
