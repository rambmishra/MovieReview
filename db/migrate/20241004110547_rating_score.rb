class RatingScore < ActiveRecord::Migration[7.1]
  def change
    create_table :rating_scores do |t|
      t.references :rating_category, null: false, foreign_key: true
      t.references :rating, null: false, foreign_key: true
      t.integer :score, null: false, default: 0

      t.timestamps
    end
  end
end
