require 'rails_helper'

feature 'User buys minutes' do
  scenario 'successfully' do
    sign_in
    click_on 'Buy Minutes'
    expect(page).to have_css("#launch-spreedly", text: "Enter Payment Info")
    click_on "Enter Payment Info"
    expect(page).to have_css("#new_charge")
      # fill_in 'Name', with: 'John Smith'
      # fill_in 'Credit Card Number', with: '4111111111111111'
      # fill_in 'month', with: '01'
      # fill_in 'year', with: '19'
      # fill_in 'CVV', with: '111'
      # click_on 'Pay Now'


  end
end

