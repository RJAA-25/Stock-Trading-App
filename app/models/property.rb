class Property < ApplicationRecord
  belongs_to :portfolio

  validates :quantity, presence: true 
  
end
