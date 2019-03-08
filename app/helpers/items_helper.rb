module ItemsHelper
  def select_items(new_items,name)
    if new_items.include?(name)
      @items = Item.includes(:category).where(categories:{large:name}).limit(4)
    else
      @items = Item.includes(:brand).where(brands:{brand:name}).limit(4)
    end
  end
end
