class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.string :name
      t.integer :percent_off
      t.date :starts_on
      t.date :ends_on

      t.timestamps
    end
  end
end
