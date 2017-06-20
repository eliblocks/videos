feature "User Views video" do
  scenario "not logged in" do
    sign_in
    video = create_video
    visit root_url
    expect(page).to have_css('.video-title-link')
    find('.video-title-link').click
    expect(page).not_to have_css("#wistia_vid")
  end
end
