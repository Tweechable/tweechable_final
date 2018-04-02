class Mention < ActiveRecord::Base
  validates :handler, presence: true

  belongs_to :lesson

  # Pulls all mentions from the twitter client
  def self.retrieve_mentions
    twitter = Twitter_API.new
    @client = twitter.client
    mentions = @client.mentions_timeline
    account_name = @client.user.screen_name
    mentions.each do |tweet|
      Mention.check_unsubscribes(tweet)
      Mention.generate_mention(tweet, account_name)
    end
  end

  # Takes a tweet and generates a mention if it's a request for a lesson to be sent
  def self.generate_mention(tweet, bot_name)
    #Retrieves the first hashtag listed in the tweet.
    lesson = Mention.identify_lesson(tweet)
    if lesson && BlockList.can_send(tweet.user.id)
      @handles = tweet.user_mentions.reject {|user| user.screen_name == bot_name}
      @handles.each do |handle|
        # FIXME: need to check the timestamp is recent but we are not doing it right now. this is kind of hacky
        if BlockList.can_receive_id(handle.id) && !Mention.where(handler: handle.screen_name, hash_tag: lesson.hash_tag).any?
          m = Mention.new
          m.favorite_count = tweet.favorite_count
          m.lang = tweet.lang
          m.retweet_count = tweet.retweet_count
          m.text = tweet.text
          m.hash_tag = lesson.hash_tag
          m.handler = handle.screen_name
          m.lesson_id = lesson.id
          m.save
          m
        end
      end
    end
  end

  # Checks if a tweet includes STOP in all caps
  # If it does, adds the person who tweeted it to a list of people who won't receive tweets
  def self.check_unsubscribes(tweet)
    if tweet.text.include?("STOP")
      BlockList.create(user_name: tweet.user.screen_name, user_id: tweet.user.id, can_receive: false)
    end
  end

  def self.reply_mentions
    mentions = Mention.where(replied: false).where.not(lesson_id: nil)
    mentions.each do |mention|
      @lesson = Lesson.find_by(id: mention.lesson_id)

      if @lesson
        twitters = Twitter_API.new
        @client = twitters.client
        to_send = "@#{mention.handler} #{@lesson.intro} #{@lesson.thread_link}"
        puts "Tweeting: #{to_send}"
        @t = @client.update(to_send)
        if !@t
          puts "Something went wrong with posting this tweet: #{to_send}"
        end

        #Right now this is assuming the reply went successfully
        mention.update(replied: true);
      end
    end
  end

  def self.identify_lesson(tweet)
    tags = tweet.text.scan(/#\S+/)
    hash_tag = tags[0]
    lesson = Lesson.find_by(hash_tag: hash_tag)
  end

end

