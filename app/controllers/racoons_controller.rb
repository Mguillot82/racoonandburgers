class RacoonsController < ApplicationController
  before_action :set_racoon, only: %i[show destroy]

  def create
    @racoon = Racoon.new
    @racoon.balance = 0
    @racoon.user_id = current_user.id
    if @racoon.save!
      redirect_to new_racoon_service_path(@racoon)
    else
      redirect_to root
    end
  end

  def show
    @disponibilities = Disponibility.available_disponibilities(@racoon)
  end

  def destroy
    @user = @racoon.user
    destroy_service
    destroy_dispo
    destroy_resa
    @racoon.destroy!

    redirect_to user_dashboard_path(current_user)
  end

  private

  def destroy_resa
    Reservation.racoon_reservations(@racoon).each do |resa|
      resa.destroy!
    end
  end

  def destroy_dispo
    Disponibility.racoon_disponibilities(@racoon).each do |dispo|
      dispo.destroy!
    end
  end

  def destroy_service
    Service.racoon_services(@racoon).each do |service|
      service.destroy!
    end
  end

  def set_racoon
    @racoon = Racoon.find(params[:id])
  end
end
