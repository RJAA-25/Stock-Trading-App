class Portfolio < ApplicationRecord
  belongs_to :user

  validates :overall_worth, presence:true 
  has_many :properties, dependent: :destroy
end
