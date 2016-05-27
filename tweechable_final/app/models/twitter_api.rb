class Twitter_API
  attr_accessor :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "DXbq8HDvnQO0PFMaIyrBVnmO7"
      config.consumer_secret     = "c8747X0QmIlXImqyVlf6S1YfoKqLBjQ0AiNetLS29M0HyHbd8R"
      config.access_token        = "729902640059056128-AOr1a3IakmF2Pc6OiQzDLzzuJq7IvD4"
      config.access_token_secret = "UU1PPcWWNAq7vBkCcDj1BK8f075rtCSWVoihEftJgnNsO"
    end
  end
end

# twitters = Twitter_API.new
# client = twitters.client
