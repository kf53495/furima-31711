class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :item_name
    validates :item_explanation

    validates :price, inclusion: { in: 300..9999999 }
    
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_payer_id
      validates :delivery_time_id
    end
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee_payer
  belongs_to :prefecture
  belongs_to :delivery_time
end
