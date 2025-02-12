class Person < ApplicationRecord
  validates :name, :email, :phone, presence: true
  belongs_to :order
end
