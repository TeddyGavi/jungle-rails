class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :products, index: true, foreign_key: :true
      t.references :users, index: true, foreign_key: :true
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
