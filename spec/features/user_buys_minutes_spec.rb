require 'rails_helper'

feature 'User buys minutes' do
  scenario 'successfully' do
    sign_in
    click_on 'Buy Minutes'
    expect(page).to have_css("#launch-spreedly")
    click_on "2000 Minutes for $10"
    expect(page).to have_css("#new_charge")
    balance = find("#balance").text.to_i
    expect(balance).to eq(0)
    source = Source.create!(provider_source_id: '555', user_id: User.first.id)

    Charge.create!(user_id: User.first.id,
                  source_id: source.id,
                  provider_charge_id: '555',
                  amount: 1000,
                  seconds: 120000)

    User.first.update(balance: 120000)
    visit root_url
    balance = find("#balance").text.to_i
    expect(balance).to eq(2000)

  end
end

