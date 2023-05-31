class DisponibilitiesController < ApplicationController
  before_action :set_racoon

  # use of scope from disponibility model to query all the disponibilities of
  # the selected racoon from disponibilities.
  def index
    @disponibilities = Disponibility.racoon_disponibilities(@racoon.id)
  end

  # No need to show a specific disponibility
  #
  # def show
  #   @disponibility = Disponibility.find()
  # end

  # should be only available for racoons
  def new
    @disponibility = Disponibility.new
  end

  # should be only available for racoons
  def create
    @disponibility = Disponibility.new(disponibility_params)
    @disponibility.racoon = @racoon
    @disponibility.status = :available
    if @disponibility.save!
      redirect_to racoon_path(@racoon)
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
      render :edit
    end
  end

  # should be only available for racoons
  def destroy
    @disponibility = Disponibility.find(params[:id])
    @disponibility.destroy
    redirect_to user_path
  end

  private

  def disponibility_params
    params.require(:disponibility).permit(:date, :status)
  end

  def set_racoon
    @racoon = Racoon.find(params[:racoon_id])
  end
end
