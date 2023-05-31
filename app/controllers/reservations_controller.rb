class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new
    @reservation.status = "pending"
    @reservation.disponibility_id = params[:disponibility]
    @reservation.racoon_id = params[:racoon]
    @reservation.user_id = current_user.id
    raise
    @reservation.save!
  end
end
