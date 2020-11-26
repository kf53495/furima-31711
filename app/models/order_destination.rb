class OrderDestination
  include ActiveModel::Model
  attr_accessor ::postal_code, :user_id, :item_id, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id

  def save
    @item = Item.find(params[:item_id])
    order = Order.create(user_id: current_user.id, item_id: @item.id)
    Destination.new(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)

    # def order_params
    #   params.permit(:user_id, :item_id).merge(user_id: current_user.id, item_id: @item.id)
    # end
  
    # def destination_params(order)
    #   params.permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id).merge(order_id: @order.id)
    # end
  end
end
