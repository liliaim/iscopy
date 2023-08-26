class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :destination            , null: false
      t.text :text                   , null: false
      t.integer :prefecture_id         , null: false
      t.string :city
      t.date   :start_date
      t.date   :end_date
      t.references :user               , null: false, foreign_key: true

      t.timestamps
    end
  end
end
