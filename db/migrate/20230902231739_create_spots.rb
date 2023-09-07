class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
    t.integer :icon_id             , null: false
    t.string  :spot_name           , null: false
    t.text    :information
    t.integer :prefecture_id       , null: false
    t.string  :address  
    t.float   :latitude 
    t.float   :longitude
    t.references :user             , null: false, foreign_key: true
    t.timestamps
    end
  end
  
end
