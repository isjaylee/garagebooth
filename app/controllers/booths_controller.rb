class BoothsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  # before_action :is_booth_owner?, only: [:show]

  def index
  end

  def new
    @booth = Booth.new
  end

  def create
    @booth = current_user.booths.build(booth_params)
    build_image

    if @booth.save
      redirect_to @booth
    else
      flash[:alert] = @booth.errors.full_messages
      render :new
    end
  end

  def show
    @booth = find_booth
    @items = @booth.items.includes(:images)
  end

  def edit
    @booth = find_booth
    @image = @booth.images.first
  end

  def update
    @booth = find_booth
    @booth.update(booth_params)
    build_image
    redirect_to @booth
  end

  private

    def booth_params
      params.require(:booth).permit(:name, :email, :address1, :address2, :city, :state, :zipcode, :start_date, :stop_date)
    end

    def find_booth
      Booth.find(params[:id])
    end

    def is_booth_owner?
      if @booth.user != current_user
        redirect_to root_path
        flash[:alert] = "You are not authorized to view this booth."
      end
    end

    def build_image
      if params[:booth][:image].present?
        @booth.images.build(image: params[:booth][:image][:image])
      end
    end
end