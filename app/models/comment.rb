class Comment < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  validates :message, presence: true
  validates :message, length: { in: 3..400 }

  belongs_to :user
  belongs_to :flat

  has_rich_text :message
end
