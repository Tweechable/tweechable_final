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
      handler = tweet.text.scan(/@\S+/)[1]
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
    mention = Mention.where(replied:false).where.not(lesson_id:nil).first
    @lesson = Lesson.find_by(id: mention.lesson_id)

    if @lesson
      twitters = Twitter_API.new
      @client = twitters.client

      # only sending out one tweet for now for demo
      # add the blank two make sure we can tag! otherwise it'd be one string
      to_send = @lesson.tweets[0].text + ' ' + mention.handler
      @t = @client.update(to_send)
      if @t
        mention.replied = true
        mention.save
      else
        #FIXME: do something here if we didn't reply the user but leave it for now meh.
      end

    end

  end

end

