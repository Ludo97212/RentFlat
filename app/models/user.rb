class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :username, presence: true
  has_many :flats, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :flats, through: :bookings
end
