class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee_payer
  belongs_to :prefecture
  belongs_to :delivery_time
end
