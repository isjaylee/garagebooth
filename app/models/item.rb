class Item < ActiveRecord::Base
  belongs_to :booth
  belongs_to :category
  has_many :images, as: :imageable
  validates :name, :description, :price, presence: true

  def self.search(params)
    # Need to get items based on booth location.
    # Get nearby booths, get all their items, then search
    # those items. ".map" returns array and we need
    # ActiveRecord Relation.
    booths = params[:location].present? ? Booth.near(params[:location], 20) : Booth.all
    items = get_booths_items(booths, params)
    items = Item.where(id: items)
    items = items.where("name ilike ?", "%#{params[:search]}%") if params[:search].present?
    items
  end

  def self.get_booths_items(booths, params)
    items = []
    booths.each { |booth| items << booth.items }
    items = items.map { |item| item.where(category_id: params[:category].to_i) }.flatten
    items = items.map { |item| item.id }
  end
end