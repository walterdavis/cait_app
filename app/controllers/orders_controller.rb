class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit destroy update]
  before_action :authenticate_admin!, only: %i[edit update destroy index]

  def new
    @order = Order.new
    @order.build_person
  end

  def create
    @order = Order.new order_params
    if @order.save
      redirect_to @order
    else
      render :new
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
    if @order.update(order_params)
      redirect_to @order
    else
      render :new
    end
  end

  def destroy
    @order.destroy
    redirect_to custom_products_path
  end

  private

  def set_order
    @order = Order.find params[:id]
  end

  def order_params
    params.require(:order)
          .permit(custom_products_attributes: [ :id, :color_id, :shape_id, :custom_text, :_destroy ],
                  person_attributes: [ :name, :email, :address, :pickup ])
  end
end
