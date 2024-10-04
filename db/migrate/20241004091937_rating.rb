class Rating < ActiveRecord::Migration[7.1]
  def change
    create_table :ratings do |t|
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
