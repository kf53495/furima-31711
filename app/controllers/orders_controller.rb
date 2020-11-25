class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.create(order_params)
    @destination = Destination.new(destination_params(@order))
    if @order.valid? && @destination.valid?
      @destination.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.permit(:user_id, :item_id).merge(user_id: current_user.id, item_id: @item.id)
  end

  def destination_params(order)
    params.permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id).merge(order_id: @order.id)
  end

end
