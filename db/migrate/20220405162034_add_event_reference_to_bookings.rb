class AddEventReferenceToBookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :event, index: true, null: false
  end
end
