require 'rails_helper'

feature "User visits homepage" do
  scenario "successfully" do
    visit root_url
    expect(page).to have_css "span", text: "Connect With Facebook"
  end
end

