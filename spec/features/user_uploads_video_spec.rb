require 'rails_helper'

feature 'User uploads video' do
  scenario 'successfully' do
    sign_in
    click_on 'Upload'
    expect(page).to have_css '#wistia_uploader'
  end
end

