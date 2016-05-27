# should be activerecord
class Mention < ActiveRecord::Base

  def self.retrieve_mentions
    twitter = Twitter_API.new
    @client = twitter.client
    mentions = @client.mentions_timeline
    mentions.each do |tweet|
      m = Mention.new
      m.in_reply_to_screen_name = tweet.in_reply_to_screen_name
      m.favorite_count = tweet.favorite_count
      m.in_reply_to_user_id = tweet.in_reply_to_screen_name
      m.lang = tweet.lang
      m.retweet_count = tweet.retweet_count
      m.text = tweet.text
      hash_tags = tweet.text.scan(/#\S+/)
      m.hash_tag = hash_tags.uniq!
      m.save
    end
  end

end

# @mention = Mention.new
# @mention.method

# Mention.retrieve_mentions