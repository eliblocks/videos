require 'rails_helper'

feature 'User uploads video' do
  scenario 'successfully' do
    sign_in
    expect(page).not_to have_css ".video-link"
    click_on 'Upload'
    expect(page).to have_css '#wistia_uploader'
    create_video
    visit root_url
    expect(page).to have_css ".video-image-link"
  end
end

