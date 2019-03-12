class RemoveVendorFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_reference :items, :vendor, foreign_key: true
  end
end
