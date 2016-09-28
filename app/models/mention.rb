# should be activerecord
class Mention < ActiveRecord::Base
  validates :handler, presence: true

  belongs_to :lesson

  # Pulls all mentions from the twitter client
  def self.retrieve_mentions
    twitter = Twitter_API.new
    @client = twitter.client
    mentions = @client.mentions_timeline
    mentions.each do |tweet|
      Mention.generate_mention(tweet)
    end
  end

  # Takes a tweet and generates a mention if it's a request for a lesson to be sent
  def self.generate_mention(tweet)
    #Retrieves the first hashtag listed in the tweet.
    #FIXME: What if people use multiple tweets
    tags = tweet.text.scan(/#\S+/)
    hash_tag = tags[0]
    lesson = Lesson.find_by(hash_tag: hash_tag)
    if lesson
      # Get a list of all the handles in a post
      handles = tweet.text.scan(/@\S+/)
      #Remove @tweechable_moments because we don't need to be sending any tweets to ourselves
      handles.delete("@tweechable")
      # for every handle in the tweet
      handles.each do |handle|
        # we already have it in the database, don't retrieve again
        # FIXME: need to check the timestamp is recent but we are not doing it right now. this is kind of hacky
        if Mention.where(handler: handle, hash_tag: hash_tag).count == 0
          m = Mention.new
          m.favorite_count = tweet.favorite_count
          m.lang = tweet.lang
          m.retweet_count = tweet.retweet_count
          m.text = tweet.text
          m.hash_tag = hash_tag
          m.handler = handle
          m.lesson_id = lesson.id
          m.save
        end
      end
    end
  end

  def self.reply_mentions
    mentions = Mention.where(replied: false).where.not(lesson_id: nil)
    mentions.each do |mention|
      @lesson = Lesson.find_by(id: mention.lesson_id)

      if @lesson
        twitters = Twitter_API.new
        @client = twitters.client

        @lesson.tweets.each do |message|
          # add the blank too make sure we can tag! otherwise it'd be one string
          to_send = message.text + ' ' + mention.handler
          puts "Tweeting: #{to_send}"
          @t = @client.update(to_send)
          if !@t
            #If something goes wrong during this process, it should probably do something about it
            puts "Something went wrong with posting this tweet: #{to_send}"
          end
        end
        #Right now this is assuming the reply went successfully
        mention.update(replied: true);
      end
    end
  end

end

