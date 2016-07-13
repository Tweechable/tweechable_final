class User < ActiveRecord::Base

  #validates :email, presence: true
  #validates :email, email: true
  validates :name, presence: true

  has_secure_password

  has_many :contributions
  has_many :lessons, :through => :contributions

end
