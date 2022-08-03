class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|
      t.integer :user_id
      t.decimal :overall_worth

      t.timestamps
    end
  end
end
