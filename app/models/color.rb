class Color < ApplicationRecord
  validates :name, presence: true
  acts_as_list top_of_list: 0
  acts_as_paranoid without_default_scope: true
end
