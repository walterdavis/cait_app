class Color < ApplicationRecord
  validates :name, presence: true
  acts_as_list top_of_list: 0

  has_many :custom_products

  acts_as_paranoid without_default_scope: true
end
