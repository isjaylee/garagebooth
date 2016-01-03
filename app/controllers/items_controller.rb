class ItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]

  def index
    @booth = find_booth
    @items = @booth.items
  end

  def new
    @booth = find_booth
    @item = Item.new(booth: @booth)
  end

  def create
    @booth = find_booth
    @item = @booth.items.build(item_params)
    build_image

    respond_to do |format|
      if @item.save
        format.html { redirect_to booth_items_path(@booth.uid, @item), notice: "Item created successfully."}
        format.json { render :show, status: :created, location: @item }
      else
        format.html { 
          flash[:danger] = @item.errors.full_messages.to_sentence
          render :new
        }
        format.json { render json: @item.errors, status: :unprocessible_entity }
      end
    end
  end

  def show
    @booth = find_booth
    @item = @booth.items.find(params[:id])
  end

  def edit
    @booth = find_booth
    @item = find_item
  end

  def update
    @booth = find_booth
    @item = find_item
    @item.update(item_params)
    @item.images.create(image: params[:item][:image][:image]) if params[:item][:image].present?
    redirect_to booth_item_path(@booth.uid, @item)
  end

  def search
    if params.present?
      @items = Item.includes(:images).includes(:booth).search(params)
    else
      @items = Item.all
    end
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :price, :category_id)
    end

    def find_booth
      Booth.find_by(uid: params[:booth_uid])
    end

    def find_item
      Item.find(params[:id])
    end

    def build_image
      if params[:item][:image].present?
        @item.images.build(image: params[:item][:image][:image])
      end
    end

end