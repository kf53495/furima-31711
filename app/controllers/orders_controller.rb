class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new(order_destination_params)
    if @order_destination.valid? #@order.valid? && @destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_destination_params
    params.permit(:user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id).merge(user_id: current_user.id, item_id: @item.id)
  end

end
