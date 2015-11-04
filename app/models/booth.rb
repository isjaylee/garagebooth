class Booth < ActiveRecord::Base
  belongs_to :user
  has_many :items
  validates :name, :address1, :city, :state, :zipcode, :start_date, :stop_date, presence: true
end