class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_one :portfolio, dependent: :destroy
  has_many :properties, through: :portfolio
  has_many :transactions, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true, inclusion: { in: ["trader", "admin"] }
  validates :status, presence: true, inclusion: { in: ["pending","approved"] }
  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :traders, -> { where(role: "trader") }
  scope :pending, -> { where(status: "pending") }
  scope :approved, -> { where(status: "approved") }
end
