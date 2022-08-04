class Portfolio < ApplicationRecord
  belongs_to :user

  validates :overall_worth, presence:true 
end
