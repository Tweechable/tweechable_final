# should be activerecord
class Mention < ActiveRecord::Base

  belongs_to :lesson

  def self.retrieve_mentions
    twitter = Twitter_API.new
    @client = twitter.client
    mentions = @client.mentions_timeline
    mentions.each do |tweet|
      #need to check that we are not adding repeated mentions but a more elegant approach...
      #FIXME: a more sophisticated approach for this
      hash_tag = tweet.text.scan(/#\S+/)[0]

      # Get a list of all the handles in a post
      handles = tweet.text.scan(/@\S+/)
      #Remove @tweechable_moments because we don't need to be sending any tweets to ourselves
      handles.delete("@tweechable")
      # handles[0] is the person who wrote the tweet, so handles[1] will be the target
      handler = handles[1]
      m = Mention.find_by(handler: handler, hash_tag: hash_tag)

      if m
        # we already have it in the database, don't retrieve again
        # FIXME: need to check the timestamp is recent but we are not doing it right now. this is kind of hacky
      else
        m = Mention.new
        m.created_at = Time.now
        m.favorite_count = tweet.favorite_count
        m.lang = tweet.lang
        m.retweet_count = tweet.retweet_count
        m.text = tweet.text
        m.hash_tag = hash_tag
        m.handler = handler

        lesson = Lesson.find_by(hash_tag: m.hash_tag)
        if lesson
          m.lesson_id = lesson.id
        else
          m.lesson_id = nil
        end
        m.save
      end

    end
  end

  def self.reply_mentions
    mentions = Mention.where(replied: false).where.not(lesson_id:nil)
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

