FactoryBot.define do
  factory :item do
    item_name {"テスト"}
    item_explanation {"これはテストです。"}
    category_id {2}
    status_id {2}
    delivery_fee_payer_id {2}
    prefecture_id {2}
    delivery_time_id {2}
    price {1000}
    association :user
  end
end
