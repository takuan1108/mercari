class AddKidsClothSmallToSizes < ActiveRecord::Migration[5.0]
  def change
    add_column :sizes, :kids_cloth_small, :string
  end
end
