require 'test_helper'

class MentionsTest < ActiveSupport::TestCase
	# test "Given a well formatted tweet, generate_mention should make a mention" do
	# 	tweet = generate_tweet("@target hey @tweechable please help #test")
	# 	Mention.generate_mention(tweet)
	# 	assert_equal(1, Mention.count, "A new tweet should have been created")
	# end

	# test "Given a well formatted tweet with tweechable first, generate_mention should make a mention" do
	# 	tweet = generate_tweet("@tweechable please help @target #test")
	# 	Mention.generate_mention(tweet)
	# 	assert_equal(1, Mention.count, "A new tweet should have been created")
	# 	assert_equal(Mention.first.handler, "@target")
	# end

	# test "If a tweet doesn't have a hashtag, no mention should be generated" do
	# 	tweet = generate_tweet("@target hey @tweechable please help test")
	# 	Mention.generate_mention(tweet)
	# 	assert_equal(0, Mention.count, "A new tweet shouldn't have been created")
	# end

	# test "If a tweet has a hashtag but it doesn't match any lessons, don't generate a mention" do
	# 	tweet = generate_tweet("@target hey @tweechable please help #hashtag #blashtag")
	# 	Mention.generate_mention(tweet)
	# 	assert_equal(0, Mention.count, "A new tweet shouldn't have been created")
	# end

	# test "If a tweet don't have a target, don't generate a mention" do
	# 	tweet = generate_tweet("I think @tweechable is a good service.")
	# 	Mention.generate_mention(tweet)
	# 	assert_equal(0, Mention.count, "A new tweet shouldn't have been created")
	# end

	# test "A mention shouldn't be generate for if we've already done that mention" do
	# 	tweet = generate_tweet("@target hey @tweechable please help #test")
	# 	Mention.generate_mention(tweet)
	# 	assert_equal(1, Mention.count, "A new tweet should have been created")

	# 	Mention.generate_mention(tweet)
	# 	assert_equal(1, Mention.count, "A tweet shouldn't have been created")
	# end

	# test "If there are two valid handles, mentions should be generated for both of them" do
	# 	tweet = generate_tweet("@target_one @target_two hey @tweechable please help #test")
	# 	Mention.generate_mention(tweet)
	# 	assert_equal(2, Mention.count, "A new tweet should have been created")
	# end

	test "If a user tweets STOP, check_unsubscribe should add them to the Blocklist" do
		blocks = BlockList.count
		tweet = generate_tweet("@tweechable STOP")
		Mention.check_unsubscribes(tweet)
		assert_equal(blocks + 1, BlockList.count, "The number of blocks should have increased")
	end

	test "If a user is on the blocklist as can't send, mentions shouldn't be generated for them" do
		no_send = block_list(:NoSend)
		tweet = generate_tweet_author("@target_one hey @tweechable please help #test", no_send.user_id, no_send.user_name)
		Mention.generate_mention(tweet)
		assert_equal(0, Mention.count, "No new mentions should have been created")
	end
end