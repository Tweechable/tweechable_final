class Twitter_API
  attr_accessor :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'g2YEJm1RBydp52WljEzapzD3k'
      config.consumer_secret = 'SDmWxQNBEAxLsKPCoa2uHEYw62vvlfHqufjeaLAJrSGK8MEeHc'
      config.access_token = '4832987493-ibfniLnH0CDANNXcTTfGUPHaTAMPtlYiPZDeHhK'
      config.access_token_secret = 'UMqaEHNQkcB2oT16gcOvz3nCwajLA1WnoqCv38IRFgeFx'
    end
  end
end

