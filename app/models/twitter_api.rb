class Twitter_API
  attr_accessor :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      # config.consumer_key = ENV['CONSUMER_KEY']
      # config.consumer_secret = ENV['CONSUMER_SECRET']
      # config.access_token = ENV['YOUR_ACCESS_TOKEN']
      # config.access_token_secret = ENV['YOUR_ACCESS_SECRET']
      config.consumer_key = '1ItFgKkr17tOboLbTNwzhW90J'
      config.consumer_secret = 'tsCgbirOBjVtriwZdkWWGEsjBKckcMgaMMh1ypkOvOGb7EGqYq'
      config.access_token = '4832987493-OhtUqloxQX1qZ9bfLlk2OdpzKqn3XtbsFDjEhqK'
      config.access_token_secret = '3X6kGiZC2d9gZK7AnFBXkSXhkjn7mjVjmWLEoZwYUEywY'
    end
  end
end

