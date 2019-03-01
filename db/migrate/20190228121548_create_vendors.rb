class CreateVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendors do |t|
      t.references :user,foreign_key: true
      t.string :bank
      t.string :bank_account
      t.integer :branch_code
      t.integer :account_number
      t.string :family_name
      t.string :first_name
      t.integer :post_number
      t.references :prefectures,foreign_key: true
      t.string :city
      t.string :address
      t.string :building_name
      t.timestamps
    end
  end
end
