class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :role
      t.decimal :balance, precision: 10, scale: 2, default: 0
      t.timestamps
    end
  end
end
