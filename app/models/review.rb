class Review < ApplicationRecord
  belongs_to :item

  validates :content, presence: true, length: { in: 15...500 }
end
