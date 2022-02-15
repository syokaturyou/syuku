class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :roomname
      t.string :roomimage_id
      t.integer :price
      t.integer :human
      t.text :roomprofile
      t.string :address

      t.timestamps
    end
  end
end
