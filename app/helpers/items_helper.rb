module ItemsHelper
  def select_items(selected_category,category)
    if selected_category.include?(category)
      @items = Item.includes(:category).where(categories:{name:category.name}).limit(4)
    else
      @items = Item.includes(:brand).where(brands:{name:category.name}).limit(4)
    end
  end
end
