class ChangeDatatypeTireOfSizes < ActiveRecord::Migration[5.0]
  def change
    change_column :sizes, :tire, :string
  end
end
