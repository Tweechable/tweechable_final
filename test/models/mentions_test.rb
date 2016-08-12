require 'test_helper'

class MentionsTest < ActiveSupport::TestCase
	test "Given a well formatted tweet, generate_mention should make a mention" do
		tweet = generate_tweet("@target hey @tweechable please help #test")
		Mention.generate_mention(tweet)
		assert_equal(1, Mention.count, "A new tweet should have been created")
	end

	test "If a tweet doesn't have a hashtag, no mention should be generated" do
		tweet = generate_tweet("@target hey @tweechable please help test")
		Mention.generate_mention(tweet)
		assert_equal(0, Mention.count, "A new tweet shouldn't have been created")
	end

	test "If a tweet has a hashtag but it doesn't match any lessons, don't generate a mention" do
		tweet = generate_tweet("@target hey @tweechable please help #hashtag #blashtag")
		Mention.generate_mention(tweet)
		assert_equal(0, Mention.count, "A new tweet shouldn't have been created")
	end

	test "If a tweet don't have a target, don't generate a mention" do
		tweet = generate_tweet("I think @tweechable is a good service.")
		Mention.generate_mention(tweet)
		assert_equal(0, Mention.count, "A new tweet shouldn't have been created")
	end

	test "A mention shouldn't be generate for if we've already done that mention" do
		tweet = generate_tweet("@target hey @tweechable please help #test")
		Mention.generate_mention(tweet)
		assert_equal(1, Mention.count, "A new tweet should have been created")

		Mention.generate_mention(tweet)
		assert_equal(1, Mention.count, "A tweet shouldn't have been created")
	end

	# tweet with multiple hashtags, the correct one isn't first

	# Tweet with multiple valid hashtags

	# Tweet with multiple targets
end