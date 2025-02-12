class PricesController < ApplicationController
  def show
    shape = Shape.find params[:id]
    product = CustomProduct.new(shape: shape, quantity: num)
    render plain: product.extended_price.to_i
  end

  private

  def num
    params[:num].to_i
  end
end
