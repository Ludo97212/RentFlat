class Comment < ApplicationRecord
  validates :message, presence: true
  validates :message, length: { minimum: 1, maximum: 200 }

  belongs_to :user
  belongs_to :flat
end
