class RenameLargeColumnToCotegories < ActiveRecord::Migration[5.0]
  def change
    rename_column :categories, :large, :name
  end
end
