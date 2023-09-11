class Plan < ApplicationRecord
  validates :destination,    presence: true
  validates :text,           presence: true
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validate :compare_date

  belongs_to :user
  has_one :record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  private

  def compare_date
    return if start_date.blank? || end_date.blank?

    if end_date < start_date
      errors.add(:end_date, 'は開始日より前の日を設定することはできません。')
    end
  end
end
