class CustomProduct < ApplicationRecord
  belongs_to :person
  belongs_to :color
  belongs_to :shape
  
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
