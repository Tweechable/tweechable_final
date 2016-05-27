class User < ActiveRecord::Base

  has_secure_password

  has_many :contributions
  has_many :lessons, :through => :contributions

end
