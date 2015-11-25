class Item < ActiveRecord::Base
  belongs_to :booth
  belongs_to :category
  has_many :images, as: :imageable

  def self.search(params)
    items = Item.where(category_id: params[:category].to_i)
    items = items.where("name ilike ?", params[:search]) if params[:search].present?
    items
  end
end