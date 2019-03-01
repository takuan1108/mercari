class CreateStreetAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :street_addresses do |t|
      t.integer :post_number
      t.references :prefecture,foreign_key: true
      t.string :city
      t.string :address
      t.string :building_name
      t.references :user,foreign_key: true
      t.timestamps
    end
  end
end
