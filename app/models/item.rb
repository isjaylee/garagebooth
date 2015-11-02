class Item < ActiveRecord::Base
  belongs_to :booth
  belongs_to :category

  def self.search(params)
    items = Item.where(category_id: params[:category].to_i)
    items = items.where("name ilike ?", params[:search])
    items
  end
end