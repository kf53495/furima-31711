class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new(order_destination_params)
    #@destination = Destination.new(destination_params(@order))
    if @order_destination.valid? #@order.valid? && @destination.valid?
      # @destination.save
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_destination_params
    params.require(:order_destination).permit(:user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id)
  end

  # def destination_params(order)
  #   params.permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id).merge(order_id: @order.id)
  # end

end
