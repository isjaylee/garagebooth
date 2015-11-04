class Booth < ActiveRecord::Base
  belongs_to :garage
  has_many :items
  validates :name, :start_date, :end_date, presence: true
end