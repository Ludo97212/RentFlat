class Comment < ApplicationRecord
  validates :message, presence: true
  validates :message, length: { minimum: 2, maximum: 400 }

  belongs_to :user
  belongs_to :flat

  has_rich_text :message
end
