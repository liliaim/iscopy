class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :destination            , null: false
      t.string :text                   , null: false
      t.integer :prefecture_id         , null: false
      t.string :city
      t.date   :start_date             , null: false
      t.date   :end_date               , null: false
      t.references :plan               , foreign_key: true
      t.references :user               , null: false, foreign_key: true
      t.timestamps
    end
  end
end
