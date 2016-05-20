class Twitter_API
  attr_accessor :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      # config.consumer_key        = "BiTP0PMdOZv3vjz5DlF2XhwKJ"
      # config.consumer_secret     = "sAIJjQFLBPQ3JDJ3TThSF0PvjyUOI6PxubWhgeHvf6Hn9tidhI"
      # config.access_token        = "728069915622531073-oPSlKMcm5j2Phr8lz6542YAGptBVSz9"
      # config.access_token_secret = "usrzd1sWqXgI4xEWnWyE4euP1mClnygTCb6AhjA3NUfZN"
      config.consumer_key        = "DXbq8HDvnQO0PFMaIyrBVnmO7"
      config.consumer_secret     = "c8747X0QmIlXImqyVlf6S1YfoKqLBjQ0AiNetLS29M0HyHbd8R"
      config.access_token        = "729902640059056128-AOr1a3IakmF2Pc6OiQzDLzzuJq7IvD4"
      config.access_token_secret = "UU1PPcWWNAq7vBkCcDj1BK8f075rtCSWVoihEftJgnNsO"
    end
  end
end

# twitters = Twitter_API.new
# client = twitters.client
