class ChangeDatatypeShippingFeeOfItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :shipping_fee, :integer
  end
end
