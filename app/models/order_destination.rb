class OrderDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :user_id, :item_id, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    @destination = Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: @order.id)
  end
end