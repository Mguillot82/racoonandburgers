class RacoonsController < ApplicationController
  before_action :set_racoon, only: %i[show destroy]

  def create
    @racoon = Racoon.new
    @racoon.balance = 0
    @racoon.user_id = current_user.id
    if @racoon.save!
      redirect_to racoon_path(@racoon)
    else
      redirect_to root
    end
  end

  def show; end

  def destroy
    @user = @racoon.user
    @racoon.destroy!
    redirect_to user_path(@user)
  end

  def set_racoon
    @racoon = Racoon.find(params[:id])
  end
end
