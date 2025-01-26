class Person < ApplicationRecord
  validates :name, :email, presence: true
end
