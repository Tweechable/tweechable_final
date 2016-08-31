class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable



  validates :name, presence: true

  has_secure_password

  has_many :contributions
  has_many :lessons, through: :contributions

end