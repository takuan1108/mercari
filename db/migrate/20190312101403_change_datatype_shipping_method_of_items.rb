class ChangeDatatypeShippingMethodOfItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :shipping_method, :integer
  end
end
