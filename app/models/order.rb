class Order < ApplicationRecord
  has_one :person, dependent: :destroy
  has_many :custom_products, dependent: :destroy

  accepts_nested_attributes_for :person, reject_if: :all_blank
  accepts_nested_attributes_for :custom_products,
    allow_destroy: true,
    reject_if: proc { |attrs| attrs["color_id"].blank? || attrs["shape_id"].blank? }

  monetize :paid_cents, allow_nil: true
  monetize :subtotal_cents
  monetize :due_cents

  def description
    custom_products.map(&:description).to_sentence
  end

  def subtotal_cents
    custom_products.map(&:extended_price_cents).sum
  end

  def due_cents
    subtotal_cents - paid_cents
  end
end
