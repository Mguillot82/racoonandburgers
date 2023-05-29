class DisponibilitiesController < ApplicationController
  def index
    @disponibilities = Disponibility.all
  end

  def show
    @disponibility = Disponibility.find(params[:id])
  end

  def new
    @disponibility = Disponibility.new
  end

  def create
    @disponibility = Disponibility.new(disponibility_params)
    if @disponibility.save
      redirect_to disponibilities_path
    else
      render :new
    end
  end

  def edit
    @disponibility = Disponibility.find(params[:id])
  end

  def update
    @disponibility = Disponibility.find(params[:id])
    if @disponibility.update(disponibility_params)
      redirect_to disponibilities_path
    else
      render :edit
    end
  end

  def destroy
    @disponibility = Disponibility.find(params[:id])
    @disponibility.destroy
    redirect_to disponibilities_path
  end

  private

  def disponibility_params
    params.require(:disponibility).permit(:date)
  end
end
