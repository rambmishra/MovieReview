class RatingCategory < ActiveRecord::Migration[7.1]
  def change
    create_table :rating_categories do |t|
      t.string :name, null: false
      t.integer :weight, default: 1

      t.timestamps
    end
    add_index :rating_categories, :name, unique: true
  end
end
