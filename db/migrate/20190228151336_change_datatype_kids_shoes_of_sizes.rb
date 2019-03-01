class ChangeDatatypeKidsShoesOfSizes < ActiveRecord::Migration[5.0]
  def change
    change_column :sizes, :kids_shoes, :string
  end
end
