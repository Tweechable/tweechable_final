ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def generate_tweet(text)
  	Twitter::Tweet.new({id: 1, 
						favorite_count: 0,
            lang: "en", 
						retweet_count: 0, 
						source: "@tweeter",
						text: text})
  end
end
