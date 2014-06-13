Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Bracketify::Application.config.google_client_id, Bracketify::Application.config.google_client_secret
end
