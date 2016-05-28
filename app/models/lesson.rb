class Lesson < ActiveRecord::Base

  has_many :tweets, :dependent => :destroy
  has_many :contributions, :dependent => :nullify  # know how often ppl contribute
  has_many :users, :through => :contributions
  has_many :mentions
  has_many :educatees

  validates :hash_tag, presence:true

end
