class AddAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :string, default: "trader"
    add_column :users, :status, :string, default: "pending"
    add_column :users, :balance, :decimal, precision: 10, scale: 2, default: 0.00
  end
end
