class GaragesController < ApplicationController

  def index
  end

  def new
    @garage = Garage.new    
  end

  def create
    @garage = Garage.new(garage_params)
    if @garage.save
      redirect_to @garage
    else
      flash[:alert] = @garage.errors.full_messages
      render :new
    end
  end

  def show
    @garage = Garage.find(params[:id])
  end

  private

    def garage_params
      params.require(:garage).permit(:name, :address1, :address2, :city, :state, :zipcode)
    end

end