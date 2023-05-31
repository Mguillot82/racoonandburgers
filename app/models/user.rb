class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :racoon
  # has_many :reservations
  has_many :reviews, through: :reservations
  has_one_attached :photo


  validates :username, presence: true, uniqueness: true, length: {
    in: 3..32,
    wrong_length: "%{count} characters. Username must have between 3 and 32 characters "
  }
  validates :first_name, presence: true, length: {
    in: 3..32,
    wrong_length: "%{count} characters. First name must have between 3 and 32 characters "
  }
  validates :last_name, presence: true, length: {
    in: 3..32,
    wrong_length: "%{count} characters. Last name must have between 3 and 32 characters "
  }
end
