class Tweet < ActiveRecord::Base
  validates :tweet_index, presence: true
  belongs_to :lesson, :touch => true

  before_validation :add_index, on: :create

  validates :text, length: { maximum: 124 }

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
      if self.tweet_index.nil?
        if !self.lesson_id.nil? && self.lesson.tweets.count > 0
          self.tweet_index = self.lesson.tweets.order(:tweet_index).last.tweet_index + 1
        else
          self.tweet_index = 0
        end
      end
    end
end
