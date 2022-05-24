class Comment < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  validates :message, presence: true
  # validates :message, length: { minimum: 2, maximum: 400 }

  belongs_to :user
  belongs_to :flat

  has_rich_text :message
end
