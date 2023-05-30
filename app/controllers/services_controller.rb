class ServicesController < ApplicationController
  before_action :set_user, only: %i[new create edit update]
  before_action :set_service, only: %i[update]

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(params_service)
    @service.user = @user
    if @service.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @service = @user.service
  end

  def update
    @service.user = @user
    if @service.update(params_service)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @service = @user.service
    @service.destroy
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_service
    @service = Service.find(params[:id])
  end

  def params_service
    params.require(:service).permit(:title, :description, :item, :price)
  end
end
