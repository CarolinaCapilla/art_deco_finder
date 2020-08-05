class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :starts_at, :ends_at, presence: true
  validate :ends_at_after_starts_at

  private

  def ends_at_after_starts_at
    return if ends_at.blank? || starts_at.blank?

    if ends_at < starts_at
      errors.add(:ends_at, "must be after the start date")
    end
  end
end
