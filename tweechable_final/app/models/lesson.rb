class Lesson < ActiveRecord::Base

  has_many :tweets, :dependent => :destroy

  validates :hash_tag, presence:true

end
