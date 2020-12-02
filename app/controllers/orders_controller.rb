class OrdersController < ApplicationController
  before_action :find_item

  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    elsif current_user.id == @item.user_id
      redirect_to root_path
    end
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_destination_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_destination_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_destination_params[:token],
      currency: 'jpy'
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
