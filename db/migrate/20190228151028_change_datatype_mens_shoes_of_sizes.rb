class ChangeDatatypeMensShoesOfSizes < ActiveRecord::Migration[5.0]
  def change
    change_column :sizes, :mens_shoes, :string
  end
end
