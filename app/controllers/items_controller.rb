class ItemsController < ApplicationController

  def new
    @booth = Booth.find(params[:booth_id])
    @item = Item.new(booth: @booth)
  end

  def create
    @booth = Booth.find(params[:booth_id])
    @item = @booth.items.build(item_params)
    if @item.save
      redirect_to [@garage, @booth]
    else
      render :back
    end
  end

  def search
    if params.present?
      @items = Item.search(params)
    else
      @items = Item.all
    end
  end

  def show
    @booth = Booth.find(params[:booth_id])
    @item = Item.find(params[:id])
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :price, :category_id)
    end

end