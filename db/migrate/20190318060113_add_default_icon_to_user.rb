class AddDefaultIconToUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :icon, :string, dafault:"member_photo_noimage"
  end
end
