class Tweet < ActiveRecord::Base

  belongs_to :lesson
  validates :text, length: { maximum: 125 }

end
