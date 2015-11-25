class ItemsController < ApplicationController

  def new
    @booth = find_booth
    @item = Item.new(booth: @booth)
  end

  def create
    @booth = find_booth
    @item = @booth.items.build(item_params)
    @item.images.build(image: params[:item][:image][:image])
    if @item.save
      redirect_to [@booth, @item]
    else
      render :back
    end
  end

  def show
    @booth = find_booth
    @item = find_item
  end

  def edit
    @booth = find_booth
    @item = find_item
  end

  def update
    @booth = find_booth
    @item = find_item
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
      Booth.find(params[:booth_id])
    end

    def find_item
      Item.find(params[:id])
    end

end