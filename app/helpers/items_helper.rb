module ItemsHelper
  def select_items(selected_category,category)
    if selected_category.include?(category)
      category = Category.descendants_of(category)
      @items = Item.includes(:category).where(categories:{id:category.ids}).limit(4)
    else
      @items = Item.where(brand:category.name).limit(4)
      # ちゃんとitemとbrandが紐づいている場合はこれ
      # @items = Item.includes(:brand).where(brands:{name:category.name}).limit(4)
    end
  end
end
