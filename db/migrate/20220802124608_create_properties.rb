class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.integer :portfolio_id
      t.integer :stock_id
      t.decimal :quantity

      t.timestamps
    end
  end
end
