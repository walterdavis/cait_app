class CustomProduct < ApplicationRecord
  belongs_to :order
  belongs_to :color
  belongs_to :shape

  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  delegate :price_cents, to: :shape
  monetize :extended_price_cents

  def description
    "#{quantity} of #{shape.name} in #{color.name}"
  end

  def extended_price_cents
    price_cents * quantity
  end
end
