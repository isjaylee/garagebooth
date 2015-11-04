class BoothsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :find_booth, only: [:show]
  before_action :is_booth_owner?, only: [:show]

  def index
  end

  def new
    @booth = Booth.new
  end

  def create
    @booth = current_user.booths.build(booth_params)
    if @booth.save
      redirect_to @booth
    else
      flash[:alert] = @booth.errors.full_messages
      render :new
    end
  end

  def show
  end

  private

    def booth_params
      params.require(:booth).permit(:name, :address1, :address2, :city, :state, :zipcode, :start_date, :stop_date)
    end

    def find_booth
      @booth = Booth.find(params[:id])
    end

    def is_booth_owner?
      if @booth.user != current_user
        redirect_to root_path
        flash[:alert] = "You are not authorized to view this booth."
      end
    end
end