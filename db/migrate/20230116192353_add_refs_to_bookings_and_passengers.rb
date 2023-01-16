class AddRefsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :flight, null: false, index: true
    add_reference :passengers, :booking, null: false, index: true
  end
end
