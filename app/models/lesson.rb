class Lesson < ActiveRecord::Base

  has_many :tweets, :dependent => :destroy
  has_many :contributions, :dependent => :nullify  # know how often ppl contribute
  has_many :users, :through => :contributions
  has_many :mentions
  has_many :educatees

  validates :hash_tag, presence:true

  def get_root_link
  	link = tweets.first.link
  	if link
  		return link
  	else
  		puts "Root link requested for Lesson with unpublished tweets."
  		return ""
  	end
  end

end
