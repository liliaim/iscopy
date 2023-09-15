class Record < ApplicationRecord
  validates :destination,    presence: true
  validates :text,           presence: true
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validate :compare_date


  belongs_to :user
  belongs_to :plan, optional: true
  validate :validate_plan_presence, if: :plan_id?

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  private

  def validate_plan_presence
    unless Plan.exists?(id: plan_id)
      errors.add(:plan_id, "specified plan does not exist")
    end
  end

  def compare_date
  return if start_date.blank? || end_date.blank?
    if end_date < start_date
      errors.add(:end_date, 'は開始日より前の日を設定することはできません。')
    end
  end

end
