class Booth < ActiveRecord::Base
  belongs_to :user
  has_many :items
  has_many :images, as: :imageable
  validates :name, presence: true

  def other_items(booth, item)
    if booth.items.last(5).include?(item)
      booth.items.last(6) - [item]
    else
      booth.items.last(5)
    end
  end
end