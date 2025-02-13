module Admin
class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit destroy update]
  before_action :authenticate_admin!

  def index
    @orders = Order.order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to admin_order_path(@order), notice: "Order was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy!
    respond_to do |format|
      format.html { redirect_to admin_orders_path, status: :see_other, notice: "Order was successfully removed." }
    end
  end

  private

  def set_order
    @order = Order.find params.expect(:id)
  end

  def order_params
    params.expect(order: [ :paid, person_attributes: [ :name, :email, :address, :pickup, :phone ],
                  custom_products_attributes: [ [ :id, :quantity, :color_id, :shape_id, :custom_text, :_destroy ] ] ])
  end
end
end
