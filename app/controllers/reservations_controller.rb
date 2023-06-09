class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show accept refuse]

  def show; end

  def create
    @reservation = Reservation.new
    @reservation.status = "pending"
    @reservation.disponibility_id = params[:disponibility]
    @disponibility = Disponibility.find(@reservation.disponibility_id)
    change_status_disponibility(@disponibility)
    @reservation.racoon_id = params[:racoon]
    @reservation.user_id = current_user.id
    if @reservation.save!

      redirect_to user_reservation_path(@reservation.user_id, @reservation.id)
    else
      redirect_to racoon_path(@reservation.racoon_id)
    end
  end

  def accept
    @reservation.status = "accepted"
    @reservation.save!
    redirect_to user_dashboard_path(current_user)
  end

  def refuse
    @reservation.status = "declined"
    @reservation.save!
    redirect_to user_dashboard_path(current_user)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to user_dashboard_path(current_user)
  end

  private

  def change_status_disponibility(disponibility)
    disponibility.status = 'reserved'

    disponibility.save!
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
    @disponibility = Disponibility.find(@reservation.disponibility_id)
    @racoon = Racoon.find(@disponibility.racoon_id)
    @service = @racoon.service
  end
end
