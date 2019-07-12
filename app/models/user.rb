class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable,
         # Settings
         timeout_in: 2.hours
  has_many :posts
  has_many :comments
  acts_as_voter
end
