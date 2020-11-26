class OrderDestination
  include ActiveModel::Model
  attr_accessor ::postal_code, :user_id, :item_id, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id
end
