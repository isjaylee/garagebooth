class ItemsController < ApplicationController
  before_action :find_booth, only: %i[new create show edit update]

  def new
    @item = Item.new(booth: @booth)
  end

  def create
    @item = @booth.items.build(item_params)
    @item.images.build(image: params[:item][:image][:image])
    if @item.save
      redirect_to [@booth, @item]
    else
      render :back
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    @item.images.create(image: params[:item][:image][:image])
    redirect_to [@booth, @item]
  end

  def search
    if params.present?
      @items = Item.search(params)
    else
      @items = Item.all
    end
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :price, :category_id)
    end

    def find_booth
      @booth = Booth.find(params[:booth_id])
    end

end