Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,
    ENV['FACEBOOK_VIDEOS_APP_ID'], ENV['FACEBOOK_VIDEOS_APP_SECRET'],
    scope: 'email,public_profile',
    info_fields: 'id,cover,name,first_name,last_name,age_range,link,gender,locale,picture,timezone,updated_time,verified,email',
    image_size: { width: 480, height: 480 },
    client_options: {
      site: 'https://graph.facebook.com/v2.9',
      authorize_url: "https://www.facebook.com/v2.9/dialog/oauth"
    }
  provider :developer
end
