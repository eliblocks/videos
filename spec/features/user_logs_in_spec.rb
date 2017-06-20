require 'rails_helper'

feature "User logs in" do
  scenario "successfully" do
    visit root_url
    expect(User.count).to eq(0)
    click_on "Connect With Facebook"
    expect(page).to have_css '#buy', text: 'Buy Minutes'
    expect(User.count).to eq(1)
  end
end
