class AddDetailsToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :totalprice, :integer
    add_column :reservations, :usedate, :integer
  end
end
