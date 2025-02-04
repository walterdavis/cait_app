class OrdersController < ApplicationController
  before_action :set_order, only: %i[show]

  def new
    @order = Order.new
    @order.build_person
    @order.custom_products.build
  end

  def create
    @order = Order.new order_params
    respond_to do |format|
      if @order.save
        format.html { redirect_to order_path(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  def set_order
    @order = Order.find params.expect(:id)
  end

  def order_params
    params.expect(order: [ person_attributes: [ :name, :email, :address, :pickup ],
                  custom_products_attributes: [ [ :id, :quantity, :color_id, :shape_id, :custom_text, :_destroy ] ] ])
  end
end
