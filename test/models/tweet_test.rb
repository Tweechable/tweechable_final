require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  setup do
    @first_tweet = tweets(:test_first_tweet)
    @second_tweet = tweets(:test_second_tweet)
    @lengthy_tweet = tweets(:lengthy_tweet)
    @tweet_with_124_length = tweets(:tweet_with_124_length)
  end

  test "tweet has index" do
    assert_not_nil(@first_tweet.tweet_index, ["tweet does not have an index"])
  end

  test "tweet has an index which is numeric" do
    assert(@second_tweet.tweet_index.is_a?(Numeric), ["tweet does not have an index which is an Integer"])
  end

  test "tweets given an index are saved with that index" do
    tweet = Tweet.new(tweet_index: 5)
    tweet.save!
    assert(tweet.tweet_index = 5, ["Saved a tweet with an index other than what it was supplied with"])
  end

  test "tweets are not valid without an index" do
    @first_tweet.tweet_index = nil
    assert_not(@first_tweet.valid?)
  end

  test "tweets cannot be over 124 characters" do
    assert_not(@lengthy_tweet.valid?, ["tweet violates the length limit"])
  end

  test "tweets with text length of 124 characters are valid" do
    assert(@tweet_with_124_length.valid?, ["tweet meets the length limit exactly"])
  end

  test "tweets with text length under 124 characters are valid" do
    assert(@first_tweet.valid?, ["tweet meets the length limit"])
  end

end