class Person < ApplicationRecord
  validates :name, :email, presence: true
  belongs_to :order
end
