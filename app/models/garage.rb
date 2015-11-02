class Garage < ActiveRecord::Base
  has_many :booths
  belongs_to :user
  validates :name, :address1, :city, :state, :zipcode, presence: true

end