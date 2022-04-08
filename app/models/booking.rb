class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :arrival, :departure, presence: true
  # validates :arrival, comparison: { less_than: :departure }
end
