class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|
      t.decimal :overall_worth, precision: 10, scale: 2, default: 0.00
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
