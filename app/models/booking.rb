class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :arrival, :departure, presence: true
  # validates :departure, comparison: { greater_than: :arrival }
end
