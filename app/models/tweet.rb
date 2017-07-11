class Tweet < ActiveRecord::Base
  validates :tweet_index, presence: true
  belongs_to :lesson, :touch => true

  before_validation :add_index, on: :create

  # tweet is 140 char max and tweeter name is 15 char max. so we we let 124 to be the max length so that
  # after we add in the (screen name + the blank) to form the tag the tweet is 140 max and allow to be published
  # validates :text, length: { maximum: 124 }
  # validate :tweet_length_below_124

  def tweet_length_below_124

  end

  # Deletes the previous version of a tweet, if one exists, and posts a new version to twitter
  def publish_tweet(client, tweet_id)
    unless twitter_id.nil?
      client.destroy_status(twitter_id)
    end

    tweet = client.update(text, in_reply_to_status_id: tweet_id)
    update(twitter_id: tweet.id)
    return twitter_id
  end

  private
    def add_index
      p "Running add_index!"
      if self.tweet_index.nil?
        if !self.lesson_id.nil? && self.lesson.tweets.count > 0
          self.tweet_index = self.lesson.tweets.order(:tweet_index).last.tweet_index + 1
        else
          self.tweet_index = 0
        end
      end
    end
end
