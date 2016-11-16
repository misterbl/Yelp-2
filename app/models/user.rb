class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :restaurants
  has_many :reviews
 # validates :username,  presence: true, length: { maximum: 50 }
#  validates :email, presence: true, length: { maximum: 255 },
#                    uniqueness: { case_sensitive: false }
# # has_secure_password
#  validates :password, presence: true, length: { minimum: 6 }

end
