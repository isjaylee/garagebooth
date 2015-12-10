require 'rails_helper'

describe Booth do

  it { should belong_to :user }
  it { should have_many :items }
  it { should have_many :images }
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :address1 }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :zipcode }
  it { should validate_presence_of :start_date }
  it { should validate_presence_of :stop_date }

end