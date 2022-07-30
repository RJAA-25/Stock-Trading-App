class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.string :type
      t.string :status
      t.decimal :amount, precision: 10, scale: 2
      t.decimal :price, precision: 10, scale: 2
      t.decimal :total_cost, precision: 10, scale: 2

      t.timestamps
    end
  end
end
