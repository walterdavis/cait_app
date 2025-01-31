class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit destroy update]
  before_action :authenticate_admin!, only: %i[edit update destroy index]

  def new
    @order = Order.new
    @order.build_person
  end

  def create
    @order = Order.new
    @order.build_person
    @order.assign_attributes order_params
    Rails.logger.info order_params.inspect
    respond_to do |format|
      if @order.save
        format.html { redirect_to order_path(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        @order.build_person
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_path(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy!
    respond_to do |format|
      format.html { redirect_to orders_path, status: :see_other, notice: "Order was successfully removed." }
      format.json { head :no_content }
    end
  end

  private

  def set_order
    @order = Order.find params.expect(:id)
  end

  def order_params
    params.expect(order: [ person_attributes: [ :name, :email, :address, :pickup ],
                  custom_products_attributes: [[ :id, :quantity, :color_id, :shape_id, :custom_text, :_destroy ]]])
  end
end
