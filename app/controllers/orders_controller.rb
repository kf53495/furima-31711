class OrdersController < ApplicationController
  def index
    @item = Item.find_by(id: params[:format])
   # @order = Order.new
  end

  def create
    item = Item.find_by(id: params[:format])
    @order = Order.new(order_params)
    destination = Destination.new(destination_params)
    if @order.save
      redirect_to root_path
    else
      render 'items/new'
    end
  end


  private

  def order_params
    params.require(:order).permit(:user_id, :item_id).merge(user_id: current_user.id, item_id: item.id)
  end

  def destination_params
    params.require(:destination).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id).merge(order_id: order.id)
  end

end
