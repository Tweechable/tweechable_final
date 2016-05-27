# should be activerecord
class Mention < ActiveRecord::Base

  def self.retrieve_mentions
    twitter = Twitter_API.new
    @client = twitter.client
    mentions = @client.mentions_timeline
    mentions.each do |tweet|
      puts tweet.in_reply_to_screen_name
      ## m = Mention.new
      #  m.content =
      #  m.save
    end

  end
end


# @mention = Mention.new
# @mention.method

# Mention.retrieve_mentions