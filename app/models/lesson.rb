class Lesson < ActiveRecord::Base

  has_many :tweets, :dependent => :destroy
  has_many :contributions, :dependent => :nullify  # know how often ppl contribute
  has_many :users, :through => :contributions
  has_many :mentions
  has_many :educatees

  validates :hash_tag, presence:true

  # Tests if there's been an update to the lesson since the last time it was posted.
  def needs_update
  	unless posted_at.nil?
	  	# Lesson's updated_at is always going to be slightly after posted_at when you post a lesson
	  	# because when you post a lesson, you immediately update it to reflect this fact.
	  	# So we add a second to posted_at to counteract this. This means you can't update lessons more
	  	# often than once a second, which I think that should be fine.
	  	updated_at > (posted_at + 1.seconds)
  	else
  		true
  	end
  end

  # Publishes all the tweets in a lesson in a thread.
  def publish
    twitters = Twitter_API.new
    client = twitters.client

    tweet_id = 0;
    tweets.order(:id).each do |tweet|
      tweet_id = tweet.publish_tweet(client, tweet_id)
    end

    update(approved: true,
    	thread_link: "https://twitter.com/tweechable/status/#{tweets.first.tweet_index}",
    	posted_at: DateTime.now)
  end
end
