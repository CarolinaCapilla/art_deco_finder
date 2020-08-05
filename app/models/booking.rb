class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:ends_at, "must be after the start date")
    end
  end
end
