class Item < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 5 }
  validates :description, presence: true, length: { in: 15...500 }
  validates :category, inclusion: { in: ["Paintings", "Abstract", "Print", "Photo", "Drawings", "Decorative"] }
end
