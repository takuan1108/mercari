class ChangeDatatypeLadiesShoesOfSizes < ActiveRecord::Migration[5.0]
  def change
    change_column :sizes, :ladies_shoes, :string
  end
end
