require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '#create' do
    before do
      @order_destination = FactoryBot.build(:order_destination)
    end

    it '配送先の情報が全て正しく入力されていたら購入できること' do
      expect(@order_destination).to be_valid
    end
    it '郵便番号が空だと購入できないこと' do
      @order_destination.postal_code = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号が「数字4文字 ハイフン 数字3文字」の形でないと購入できないこと' do
      @order_destination.postal_code = '1231234'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Postal code is invalid')
    end
    it '都道府県が選択されていないと購入できないこと' do
      @order_destination.prefecture_id = 1
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it '市区町村が空だとと登録できないこと' do
      @order_destination.municipality = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が空だと購入できないこと' do
      @order_destination.address = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号にはハイフンは不要であること' do
      @order_destination.phone_number = '090-1234-1234'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号は10桁もしくは11桁であること' do
      @order_destination.phone_number = '12345'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号が空だと購入できないこと' do
      @order_destination.phone_number = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
    end
  end
end
