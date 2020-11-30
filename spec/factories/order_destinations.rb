FactoryBot.define do
  factory :order_destination do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"111-1111"}
    prefecture_id {2}
    municipality {"あ区あ市"}
    address {"あ町1-1-1"}
    building_name {"あいうえお"}
    phone_number {"07012345678"}
  end
end
