class Message

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :content, :owner_email

  validates :name, :email, :content, :owner_email, presence: true
end