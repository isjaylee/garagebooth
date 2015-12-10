require 'rails_helper'

describe Item do
  it { should belong_to :booth }
  it { should belong_to :category }
  it { should have_many :images }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price }
end