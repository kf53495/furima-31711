class OrdersController < ApplicationController
  def index
    @item = Item.find_by(id: params[:format])
    @order = Order.new
  end

  def create
  end
end
