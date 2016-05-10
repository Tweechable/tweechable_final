class Twitter_API
  attr_accessor :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "YOUR CONSUMER KEY"
      config.consumer_secret     = "YOUR CONSUMER SECRET"
      config.access_token        = "YOUR ACCESS TOKEN"
      config.access_token_secret = "YOUR ACCESS SECRET"
    end
  end
end