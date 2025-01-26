class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit destroy update]
  before_action :authenticate_admin, only: %i[edit update destroy index]

  def new
    @order = CustomProduct.new
    @order.build_person
  end

  def create
    @order = CustomProduct.new order_params
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def index
    @orders = CustomProduct.all
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
    @order = CustomProduct.find params[:id]
  end

  def order_params
    params.require(:custom_product)
          .permit(:color_id, :shape_id, :custom_text,
                  person_attributes: [:name, :email, :address, :pickup])
  end

  def authenticate_admin
    authenticate_or_request_with_http_basic do |username, password|
      username == 'mudder' && password == 'bill is my uncle'
    end
  end
end
