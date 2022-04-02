class Flat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, :address, :daily_price, :area, :description, presence: true
  validates :area, :daily_price, numericality: { greater_than: 0, only_integer: true }
end
