class Transaction < ApplicationRecord
  belongs_to :user

  validates :type, presence: true, inclusion: { in: ["buy", "sell"] } 
  validates :quantity, presence: true 
  validates :price, presence: true 
  validates :total_amount, presence: true 
end
