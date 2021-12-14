class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @current_cart.cart_items.each do |item|
      @order.cart_items << item
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to root_path, notice: "Order Successfully Placed"
  end

  def show
    @order = Order.find(params[:id])
  end

  private
    def order_params
      params.require(:order).permit(:name, :email, :address, :pay_method)
    end

end
