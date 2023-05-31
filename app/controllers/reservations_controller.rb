class ReservationsController < ApplicationController


  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_racoon
    @racoon = Racoon.find(params[:racoon_id])
  end
end
