class Item < ApplicationRecord
  has_one_attached :photo
  belongs_to :user

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :category, inclusion: { in: ["Paintings", "Abstract", "Print", "Photo", "Drawings", "Decorative"]}
end
