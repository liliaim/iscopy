class Spot < ApplicationRecord
  validates :icon_id, numericality: { other_than: 0 , message: "can't be blank"} 

  validates :spot_name,    presence: true
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}


  belongs_to :user


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :icon


  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode #緯度と経度の情報を住所に変換
end
