class DisponibilitiesController < ApplicationController
  before_action :set_racoon

  # use of scope from disponibility model to query all the disponibilities of
  # the selected racoon from disponibilities.

  # should be only available for racoons
  def new
    @disponibility = Disponibility.new
  end

  # should be only available for racoons
  def create
    @disponibility = Disponibility.new(disponibility_params)
    @disponibility.racoon = @racoon
    @disponibility.status = 'available'
    if @disponibility.save!
      redirect_to user_dashboard_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # should be only available for racoons
  def update
    @disponibility = Disponibility.find(params[:id])
    if @disponibility.update(disponibility_params)
      redirect_to user_path
    else
      redirect_to user_dashboard_path
    end
  end

  # should be only available for racoons
  def destroy
    @disponibility = Disponibility.racoon_disponibilities(params[:id])
    @disponibility.each do |dispo|
      if dispo.id == Disponibility.find(params[:id])
        dispo.destroy!
      end
    end
    redirect_to user_dashboard_path(current_user)
  end

  private

  def disponibility_params
    params.require(:disponibility).permit(:date, :status)
  end

  def set_racoon
    @racoon = Racoon.find(params[:racoon_id])
  end
end
