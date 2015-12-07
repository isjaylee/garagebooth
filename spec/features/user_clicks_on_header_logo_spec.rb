require "rails_helper"

RSpec.feature "User clicks on header logo" do
  scenario "they see the homepage" do
    visit root_path
    click_on "Garage Booth"

    expect(current_path).to eql root_path
  end
end