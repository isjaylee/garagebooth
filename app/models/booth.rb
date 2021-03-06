class Booth < ActiveRecord::Base
  include SharedMethods
  belongs_to :user
  has_many :items
  has_many :images, as: :imageable
  validates :name, :email, :address1, :city, :state, :zipcode, :start_date, :stop_date, presence: true
  before_create :set_uid

  geocoded_by :full_address
  after_validation :geocode

  default_scope { where(archived: false) }

  def other_items(booth, item)
    if booth.items.includes(:images).last(5).include?(item)
      booth.items.includes(:images).last(6) - [item]
    else
      booth.items.includes(:images).last(5)
    end
  end

  def full_address
    [address1, address2, city, state, zipcode].join(', ')
  end

  def set_uid
    self.uid = rand(100000..999999)
  end
end