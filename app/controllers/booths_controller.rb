class BoothsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :is_booth_owner?, only: %i[edit update]

  def index
    # visitor_latitude = request.location.latitude
    # visitor_longitude = request.location.longitude
    visitor_latitude = 44.9778
    visitor_longitude = -93.2650
    @booths = Booth.near([visitor_latitude, visitor_longitude], 20).includes(:images)
  end

  def nearby_booths
    # visitor_latitude = request.location.latitude
    # visitor_longitude = request.location.longitude
    visitor_latitude = 44.9778
    visitor_longitude = -93.2650
    render json: Booth.near([visitor_latitude, visitor_longitude], 20).includes(:images).as_json(only: [:uid,
                                                                                                        :name,
                                                                                                        :address1,
                                                                                                        :address2,
                                                                                                        :city,
                                                                                                        :state,
                                                                                                        :zipcode,
                                                                                                        :description,
                                                                                                        :start_date,
                                                                                                        :stop_date,
                                                                                                        :latitude,
                                                                                                        :longitude])
  end

  def new
    @booth = Booth.new
  end

  def create
    @booth = current_user.booths.build(booth_params)
    build_image

    if @booth.save
      redirect_to booth_path(@booth.uid)
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
    if @booth.update(booth_params)
      build_image
      redirect_to booth_path(@booth.uid)
    else
      render :edit
    end
  end

  def destroy
    @booth = find_booth
    @booth.archive
    redirect_to dashboard_path
  end

  private

    def booth_params
      params.require(:booth).permit(:name, :email, :address1, :address2, :city, :state, :zipcode, :start_date, :stop_date)
    end

    def find_booth
      Booth.find_by(uid: params[:uid])
    end

    def is_booth_owner?
      @booth = find_booth
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