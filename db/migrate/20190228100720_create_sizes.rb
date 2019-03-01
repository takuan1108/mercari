class CreateSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sizes do |t|
      t.string    :croth
      t.decimal   :mens_shoes,precision: 3, scale: 1
      t.decimal   :ladies_shoes,precision: 3, scale: 1
      t.decimal   :kids_shoes,precision: 3, scale: 1
      t.string    :tv
      t.string    :bike
      t.integer   :tire
      t.timestamps
    end
  end
end
