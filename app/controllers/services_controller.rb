class ServicesController < ApplicationController
  before_action :set_racoon, only: %i[new create edit update]
  before_action :set_service, only: %i[update]

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(params_service)
    @service.racoon_id = @racoon.id
    if @service.save!
      redirect_to racoon_path(@racoon)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @service = @racoon.service
  end

  def update
    @service.racoon = @racoon
    if @service.update(params_service)
      redirect_to racoon_path(@racoon)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @racoon = Racoon.find(params[:id])
    @service = @racoon.service
    @service.destroy
    redirect_to racoon_path(@racoon)
  end

  private

  def set_racoon
    @racoon = Racoon.find(params[:racoon_id])
  end

  def set_service
    @service = Service.find(params[:id])
  end

  def params_service
    params.require(:service).permit(:title, :description, :item, :price)
  end
end
