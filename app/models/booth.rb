class Booth < ActiveRecord::Base
  belongs_to :user
  has_many :items
  has_many :images, as: :imageable
  validates :name, :address1, :city, :state, :zipcode, :start_date, :stop_date, presence: true

  def other_items(booth, item)
    if booth.items.last(5).include?(item)
      booth.items.last(6) - [item]
    else
      booth.items.last(5)
    end
  end

  def image_or_default
    if self.images.present?
      images.first.image.thumb("540x400").url
    else
      "http://placehold.it/540x400"
    end
  end
end