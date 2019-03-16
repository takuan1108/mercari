module ItemsHelper
  def select_items(selected_category,category)
    if selected_category.include?(category)
      @items = Item.includes(:category).where(categories:{name:category.name}).limit(4)
      # @items1 = Item.includes(:category).where(categories:Category.where(name:category.name)).limit(4)
      # @large_category = Category.descendants_of(category)
      # @items2 = Item.includes(:category).where(Category.descendants_of(category)).limit(4)
      # binding.pry
    else
      @items = Item.where(brand:category.name).limit(4)
      # ちゃんとitemとbrandが紐づいている場合はこれ
      # @items = Item.includes(:brand).where(brands:{name:category.name}).limit(4)
    end
  end

  def show_item_images(images)
    images.each_with_index do |image,i|
      image_tag(image.image,class:'bottom-image-little',value:i)
      binding.pry
    end
  end
end
