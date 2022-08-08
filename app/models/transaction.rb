class Transaction < ApplicationRecord
  belongs_to :user

  validates :action, presence: true, inclusion: { in: ["buy", "sell"] } 
  validates :quantity, presence: true 
  validates :price, presence: true 
  validates :total_amount, presence: true 
end
