OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  configure do |config|
    config.path_prefix = "/auth"
  end
  provider :facebook, ENV['FB_ID'], ENV['FB_SECRET']
end