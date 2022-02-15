class RemoveDetailsFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :human, :integer
  end
end
