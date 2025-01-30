class Order < ApplicationRecord
  belongs_to :person
  has_many :custom_products

  accepts_nested_attributes_for :person, reject_if: :all_blank
  accepts_nested_attributes_for :custom_products,
    allow_destroy: true,
    reject_if: proc { |attrs| attrs["color_id"].blank? || attrs["shape_id"].blank? }

  def description
    custom_products.map(&:description).to_sentence
  end
end
