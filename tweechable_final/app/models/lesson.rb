class Lesson < ActiveRecord::Base

  has_many :tweets, :dependent => :destroy
  has_many :contributions
  has_many :users, :through => :contributions
  has_many :educatees

  validates :hash_tag, presence:true

end
