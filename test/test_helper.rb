require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
# require 'minitest/rails'
require 'minitest/reporters'
require 'block_list'


reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  self.use_transactional_fixtures = true
  set_fixture_class contacts: Contact
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def generate_tweet(text)
  	Twitter::Tweet.new({id: 1,
						favorite_count: 0,
            lang: "en",
						retweet_count: 0,
						source: "@tweeter",
						text: text,
            tweet_index: 0,
            user: {
              id: 0,
              screen_name: "tweeter"
              }})
  end

  def generate_tweet_author(text, author_id, author_screen_name)
    Twitter::Tweet.new({id: 1,
                favorite_count: 0,
                lang: "en",
                retweet_count: 0,
                source: "@#{author_screen_name}",
                text: text,
                user: {
                  id: author_id,
                  screen_name: author_screen_name
                  }})
  end

  def generate_tweet_with_author_and_mentions(text, author_id, author_screen_name, educatee_id, educatee_screen_name)
    tweet = Twitter::Tweet.new({id: 1,
                favorite_count: 0,
                lang: "en",
                retweet_count: 0,
                source: "@#{author_screen_name}",
                text: text,
                user: {
                  id: author_id,
                  screen_name: author_screen_name
                  },
                user_mentions: [{
                  id: educatee_id,
                  screen_name: educatee_screen_name
                  }]})
  end

end
