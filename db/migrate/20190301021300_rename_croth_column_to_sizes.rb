class RenameCrothColumnToSizes < ActiveRecord::Migration[5.0]
  def change
    rename_column :sizes, :croth, :cloth
  end
end
