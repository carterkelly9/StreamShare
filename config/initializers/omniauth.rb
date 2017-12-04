require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "b40d6ac2a04d41069deddaf5a88f9794", "7cdaa55907b949f68f7b415683ce860f", scope: 'playlist-modify-public user-library-read user-library-modify'
end
