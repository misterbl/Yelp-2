Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['376687579339706'], ENV['1aa292a06196f8b3ed1ae946174aa4c5']
end
