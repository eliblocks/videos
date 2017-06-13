require 'rails_helper'

feature "User logs in" do
  scenario "successfully" do
    visit root_url
    click_on "Connect With Facebook"
    expect(page).to have_css '#buy', text: 'Buy Minutes'
  end
end
