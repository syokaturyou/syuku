class AddPricesToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :price, :integer
  end
end
