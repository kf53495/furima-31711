class OrderDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :user_id, :item_id, :prefecture_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{1,11}\z/ }
  end

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    @destination = Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: @order.id)
  end
end
