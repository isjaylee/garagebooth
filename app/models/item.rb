class Item < ActiveRecord::Base
  belongs_to :booth
  belongs_to :category
  has_many :images, as: :imageable
  validates :name, :description, :price, presence: true

  def self.search(params)
    items = Item.where(category_id: params[:category].to_i)
    items = items.where("name ilike ?", params[:search]) if params[:search].present?
    items
  end

  def image_or_default
    if self.images.present?
      images.first.image.thumb("540x400").url
    else
      "http://placehold.it/540x400"
    end
  end
end