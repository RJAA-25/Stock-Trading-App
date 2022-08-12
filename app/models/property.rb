class Property < ApplicationRecord
  belongs_to :portfolio

  validates :quantity, presence: true 
  
  default_scope { order(quantity: :desc) }
end
