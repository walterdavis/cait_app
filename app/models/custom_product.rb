class CustomProduct < ApplicationRecord
  belongs_to :person
  belongs_to :color
  belongs_to :shape

  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  accepts_nested_attributes_for :person, reject_if: :all_blank

  def description
    "#{quantity} of #{shape.name} in #{color.name}"
  end
end
