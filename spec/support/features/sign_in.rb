module Features

  def sign_in
    visit root_url
    click_on "Connect With Facebook"
  end
end
