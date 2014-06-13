Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Shopifify::Application.config.google_client_id, Shopifify::Application.config.google_client_secret
end
