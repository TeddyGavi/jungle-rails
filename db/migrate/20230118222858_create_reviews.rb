class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :product, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
