class Plan < ApplicationRecord
  validates :destination,    presence: true
  validates :text,           presence: true
  validates :prefecture_id,  presence: true
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}


  belongs_to :user
  has_one :record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture


end
