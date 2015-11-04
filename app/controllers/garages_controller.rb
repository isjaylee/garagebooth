class GaragesController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :find_garage, only: [:show]
  before_action :is_garage_owner?, only: [:show]

  def index
  end

  def new
    @garage = Garage.new    
  end

  def create
    @garage = current_user.garages.build(garage_params)
    if @garage.save
      redirect_to @garage
    else
      flash[:alert] = @garage.errors.full_messages
      render :new
    end
  end

  def show
    @booths = Booth.where(garage_id: @garage)
  end

  private

    def garage_params
      params.require(:garage).permit(:name, :address1, :address2, :city, :state, :zipcode)
    end

    def find_garage
      @garage = Garage.find(params[:id])
    end

    def is_garage_owner?
      if @garage.user != current_user
        redirect_to root_path
        flash[:alert] = "You are not authorized to view this garage."
      end
    end

end