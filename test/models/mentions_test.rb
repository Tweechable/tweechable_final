require 'test_helper'
require_relative '../../app/models/block_list'

class MentionsTest < ActiveSupport::TestCase

	setup do
		@twitter = Twitter_API.new
		@client = @twitter.client
	end

	test "If a user tweets STOP, check_unsubscribe should add them to the Blocklist" do
		blocks = BlockList.count
		tweet = generate_tweet_that_mentions_only_tweechable("@tweechable STOP", "tweechable", 1)
		Mention.check_unsubscribes(tweet)
		assert_equal(blocks + 1, BlockList.count, "The number of blocks should have increased")
	end

	test "If a tweet doesn't have a hashtag, no mention should be generated" do
		tweet = generate_tweet_with_mentions("@target hey @tweechable please help test", "tweechable", 1, "target", 2)
		lesson = Mention.identify_lesson(tweet)
		assert_nil(lesson, "A lesson shouldn't have been identified")
	end

	test "If a tweet has a hashtag but it doesn't match any lessons, don't generate a mention" do
		tweet = generate_tweet_with_mentions("@target hey @tweechable please help #hashtag #blashtag", "tweechable", 1, "target", 2)
		lesson = Mention.identify_lesson(tweet)
		assert_nil(lesson, "A lesson shouldn't have been identified")
	end

	test "If a user is on the blocklist as can't receive, mentions shouldn't be generated for them" do
		no_receive = block_lists(:NoReceive)
		tweet = generate_tweet_with_mentions("@NoReceive hi @tweechable please help test #test", "tweechable", 1,  "NoReceive", 101)
		Mention.generate_mention(tweet, "tweechable")
		assert_equal(0, Mention.count, "No new mentions should have been created")
	end

	test "If a user is on the blocklist as can't send, mentions shouldn't be generated for them" do
		no_send = block_lists(:NoSend)
		tweet = generate_tweet_author("@target_one hey @tweechable please help #test", no_send.user_id, no_send.user_name)
		Mention.generate_mention(tweet, "tweechable")
		assert_equal(0, Mention.count, "No new mentions should have been created")
	end

	test "Given a well formatted tweet, generate_mention should make a mention" do
		tweet = generate_tweet_with_author_and_mentions("@test_educatee_not_on_blocklist hey @tweechable please help #test", 1, "tweechable_user", 2, "test_educatee_not_on_blocklist", 3, "tweechable")
		Mention.generate_mention(tweet, "tweechable")
		assert_equal(1, Mention.count, "A new mention should have been created")
	end

	test "Given a well formatted tweet with tweechable first, generate_mention should make a mention" do
		tweet = generate_tweet_with_mentions("@tweechable please help @test_educatee_not_on_blocklist #test", "tweechable", 1, "test_educatee_not_on_blocklist", 2)
		Mention.generate_mention(tweet, "tweechable")
		assert_equal(1, Mention.count, "A new mention should have been created")
		assert_equal(Mention.first.handler, "test_educatee_not_on_blocklist")
	end

	test "If a tweet doesn't have a target, don't generate a mention" do
		tweet = generate_tweet_that_mentions_only_tweechable("I think @tweechable is a good service.", "tweechable", 1)
		Mention.generate_mention(tweet, "tweechable")
		assert_equal(0, Mention.count, "A new tweet shouldn't have been created")
	end

	test "A mention shouldn't be generated for an exchange if we've already done that mention" do
		tweet = generate_tweet_with_mentions("@educatee contacted hey @tweechable please help #test", "tweechable", 1, "educatee", 2)
		Mention.generate_mention(tweet, "tweechable")
		assert_equal(1, Mention.count, "A new mention should have been created")

		Mention.generate_mention(tweet, "tweechable")
		assert_equal(1, Mention.count, "A mention shouldn't have been created")
	end

	test "If there are two valid handles, mentions should be generated for both of them" do
		tweet = generate_tweet_with_multiple_educatees("@target_one @target_two hey @tweechable please help #test", "tweechable", 1, "target_one", 2, "target_two", 3)
		Mention.generate_mention(tweet, "tweechable")
		assert_equal(2, Mention.count, "Two new mentions should have been created")
	end

	test "If a mention doesn't have a lesson id associated with it, reply_mentions won't respond to it" do
		tweet_count_before_test = Tweet.count
		mention_without_lesson_id = Mention.create(id: 0, created_at: Time.now, favorite_count: 3, lang: "English", retweet_count: 5, text: "a mention", hash_tag: "#test", replied: false, handler: "unaware person")
		Mention.reply_mentions
		assert_equal(tweet_count_before_test, Tweet.count, "A new tweet shouldn't have been created")
	end

	test "If a mention has already been replied to, reply_mentions won't respond to it" do
		tweet_count_before_test = Tweet.count
		mention_already_replied_to = Mention.create(id: 0, created_at: Time.now, favorite_count: 3, lang: "English", retweet_count: 5, text: "a mention", hash_tag: "#test", replied: true, lesson_id: 0, handler: "unaware man")
		Mention.reply_mentions
		assert_equal(tweet_count_before_test, Tweet.count, "A new tweet shouldn't have been created")
	end

	test "If a mention has a nonexistent lesson id associated with it, reply_mentions won't respond to it" do
		tweet_count_before_test = Tweet.count
		mention_with_nonexistent_lesson_id = Mention.create(id: 0, created_at: Time.now, favorite_count: 3, lang: "English", retweet_count: 5, text: "a mention", hash_tag: "#test", replied: false, lesson_id: 34, handler: "unaware man")
		Mention.reply_mentions
		assert_equal(tweet_count_before_test, Tweet.count, "A new tweet shouldn't have been created")
	end

# below test currently broken because the Mention.reply_mentions returns mentions, not tweets, and I don't know how to isolate and test the tweet created by this method
	# test "If a mention is well formatted, it will trigger a tweet that contains the educatee's handle with an @ symbol before it" do
	# 	well_formatted_mention = Mention.create(id: 0, created_at: Time.now, favorite_count: 3, lang: "English", retweet_count: 5, text: "a well-formatted mention", hash_tag: "#test", replied: false, lesson_id: 0, handler: "unaware_person")
	# 	result_tweet = Mention.reply_mentions[0]
	# 	assert_match("unaware_person", result_tweet.text)
	# end

	test "If a mention is well formatted, it will trigger a tweet that contains the lesson's intro" do
		well_formatted_mention = Mention.create(id: 0, created_at: Time.now, favorite_count: 3, lang: "English", retweet_count: 5, text: "a well-formatted mention", hash_tag: "#test", replied: false, lesson_id: 0, handler: "unaware_person")
		result = Mention.reply_mentions[0]
		assert_equal(result.lesson.intro, "Hi, I heard you want to hear about #test")
	end

	test "If a mention is well formatted, it will trigger a tweet that contains the lesson's thread link" do
		well_formatted_mention = Mention.create(id: 0, created_at: Time.now, favorite_count: 3, lang: "English", retweet_count: 5, text: "a well-formatted mention", hash_tag: "#test", replied: false, lesson_id: 0, handler: "unaware_person")
			result = Mention.reply_mentions[0]
			target_id = result.lesson.tweets.first.tweet_index
			assert_equal(result.lesson.thread_link, "https://twitter.com/tweechable/status/#{target_id}")
	end

	test "If a tweet contains the name of the tweechable bot, tweechable will not tweet at itself" do
		tweet = generate_tweet_with_author_and_mentions("hi @tweechable please explain #test to @unaware_person", 1, "tweechable_user", 2, "unaware_person", 3, "tweechable")
		Mention.generate_mention(tweet, "tweechable")
		num_mentions = Mention.all.size
		assert_equal(1, num_mentions, "There should be only one mention")
	end

end