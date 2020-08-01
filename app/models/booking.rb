class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :date, presence: true
end
