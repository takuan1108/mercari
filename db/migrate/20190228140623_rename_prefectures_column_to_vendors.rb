class RenamePrefecturesColumnToVendors < ActiveRecord::Migration[5.0]
  def change
    rename_column :vendors, :prefectures_id, :prefecture_id
  end
end

