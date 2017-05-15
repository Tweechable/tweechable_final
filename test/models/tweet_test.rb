require 'test_helper'

class TweetTest < ActiveSupport::TestCase

  # test "tweet has index" do
  #   assert_not_nil(tweet.index, ["tweet does not have an index"])
  # end

  # test "tweet has an index which is an Integer" do
  #   assert_instance_of(Integer, tweet.index, ["tweet does not have an index which is an Integer"])
  # end

  test "should not save a tweet without an index" do
    tweet = Tweet.new
    assert_not tweet.save, "Saved the tweet without an index"
  end

end