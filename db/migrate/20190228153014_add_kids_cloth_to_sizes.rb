class AddKidsClothToSizes < ActiveRecord::Migration[5.0]
  def change
    add_column :sizes, :kids_cloth, :string
  end
end
