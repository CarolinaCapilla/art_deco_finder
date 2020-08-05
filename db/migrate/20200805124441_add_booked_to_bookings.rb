class AddBookedToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :booked, :boolean, default: false
  end
end
