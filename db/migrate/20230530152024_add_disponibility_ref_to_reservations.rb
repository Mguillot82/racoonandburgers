class AddDisponibilityRefToReservations < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :disponibility, null: false, foreign_key: true
  end
end
