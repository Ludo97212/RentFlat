class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates :password, length: { minimum: 8, maximum: 50 }, on: :create
  validates :email, :username, :first_name, :last_name, presence: true
  validates :email, :username, uniqueness: true
  validates :username, length: { in: 4..50 }

  # ^(?=.*[A-Z])(?=.*[?!@#$&*,;:ù%.§µ£¤])(?=.*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8,20}$
  # /\A([^\}\{\]\[@\s\,]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, format: { with: /\A([^\}\{\]\[@\s\,]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: "Mauvais format d'adresse email" }

  has_many :flats, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :flats, through: :bookings
  has_one_attached :avatar
end
