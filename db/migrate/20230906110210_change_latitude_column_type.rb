class ChangeLatitudeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :spots, :latitude, :decimal, precision: 10, scale: 8
    change_column :spots, :longitude, :decimal, precision: 10, scale: 7
  end
end
