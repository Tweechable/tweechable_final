class User < ActiveRecord::Base
	
	attr_accessor :username
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :username, presence: true

  has_many :contributions
  has_many :lessons, through: :contributions

end