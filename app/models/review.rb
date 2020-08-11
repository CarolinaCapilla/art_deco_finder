class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :content, presence: true, length: { in: 15...500 }
end
