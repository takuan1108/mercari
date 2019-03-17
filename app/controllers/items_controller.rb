class ItemsController < ApplicationController

  def index
    @pick_up_categories = Category.where(pick_up:1)
    @pick_up_blands = Brand.where(pick_up:1)
  end

  def new
    @item = Item.new
    @item.item_images.build
    @brands = Brand.all
    gon.middle = Category.where(id:[15..153])
    gon.small  = Category.where(id:[154..1212])
    gon.size = Size.all
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        params[:image].each do |image|
          @item.item_images.create(image: image)
        end
        redirect_to root_path
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

  def destroy
    item = Item.find(params[:id])
    item.destroy if item.vendor_id == current_user.id
    redirect_to users_path
  end

  def edit
    @item = Item.find(params[:id])
    @item.item_images.build
    @large = Category.roots
    @category = @item.category
    gon.category = @category
    gon.middle_category = @category.parent
    @middle = @category.parent
    @small = @category.root
    @image = ItemImage.where(params[:item_id])
    gon.middle = Category.where(id:[15..153])
    gon.small  = Category.where(id:[154..1212])
    gon.size = Size.all
    gon.image = @item.item_images
  end

  def update
    @item = Item.find(params[:id])
    if @item.vendor_id == current_user.id
      @item.update(edit_item_params)
      if params[:image]
         params[:image].each do |image|
           @item.item_images.create(image: image)
         end
      end
      redirect_to item_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name,:description,:price,:condition,:shipping_fee,:shipping_date,:shipping_method,:prefecture_id,:size_id,:category_id,:brand,item_images_attributes: [:image]).merge(vendor_id: current_user.id)

  end
  def edit_item_params
    params.require(:item).permit(:name,:description,:price,:condition,:shipping_fee,:shipping_date,:shipping_method,:prefecture_id,:size_id,:category_id,:brand)
  end
end
