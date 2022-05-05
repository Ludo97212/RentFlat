class Comment < ApplicationRecord
  validates :message, presence: true
  validates :message, length: { minimum: 1, maximum: 200 }
end
