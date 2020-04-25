# frozen_string_literal: true

Yt.configure do |config|
  config.client_id = ENV['YT_CLIENT_ID']
  config.client_secret = ENV['YT_CLIENT_SECRET']
  config.api_key = ENV['YOUTUBE_API_KEY']
end
