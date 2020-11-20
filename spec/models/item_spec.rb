require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/test.png')
    end

    it '全ての情報が正しく記入されていたら登録できること' do
      expect(@item).to be_valid
    end

    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.item_explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item explanation can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品の状態についての情報が必須であること' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end
    it '配送料の負担についての情報が必須であること' do
      @item.delivery_fee_payer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee payer must be other than 1")
    end
    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it '発送までの日数についての情報が必須であること' do
      @item.delivery_time_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
    end
    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格の範囲が、¥300より低いと登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it '価格の範囲が、¥9999999より高いと登録できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
  end
end
