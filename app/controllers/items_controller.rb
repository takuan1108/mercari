class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @item.item_images.build
    gon.middle = Category.where(id:[15..153])
    cloth = Category.find(15)
    gon.cloth = cloth.size_id
    gon.small  = Category.where(id:[154..1212])
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        params[:image].each do |image|
          @item.item_images.create(image: image)
        end
      else
        render 'new'
      end
  end

  def show
  end

  def buy
  end

  def image
  end

  private
  def item_params
    params.require(:item).permit(:name,:description,:price,:condition,:shipping_fee,:shipping_date,:shipping_method,:prefecture_id,:size_id,:category_id,item_images_attributes: [:image])

  end
end
