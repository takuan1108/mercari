class RemoveVendorIdFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :vendor_id, :integer
  end
end
