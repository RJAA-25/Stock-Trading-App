class User < ApplicationRecord
  has_many :transactions
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true, inclusion: { in: ["trader", "admin"] }
  validates :balance, presence: true, comparison: { greater_than_or_equal_to: 0 }
end
