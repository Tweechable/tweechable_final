class Tweet < ActiveRecord::Base

  belongs_to :lesson

  # tweet is 140 char max and tweeter name is 15 char max. so we we let 124 to be the max length so that
  # after we add in the (screen name + the blank) to form the tag the tweet is 140 max and allow to be published
  # validates :text, length: { maximum: 124 }
  # validate :tweet_length_below_124

  def tweet_length_below_124

  end

end
