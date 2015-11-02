class Booth < ActiveRecord::Base
  belongs_to :garage
  has_many :items
end