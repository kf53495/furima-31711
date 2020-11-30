require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '#create' do
    before do
      @order_destination = FactoryBot.build(:order_destination)
    end

    it "配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること" do 
    end
    it "郵便番号が空だと購入できないこと" do 
    end
    it "郵便番号が「数字4文字 ハイフン 数字3文字」の形でないと購入できないこと" do
      
    end
    it "都道府県が選択されていないと購入できないこと" do
      
    end
    it "市区町村が空だとと登録できないこと" do
      
    end
    it "番地が空だと購入できないこと" do
      
    end
    it "電話番号にはハイフンは不要で、10桁もしくは11桁であること" do
      
    end
    it "電話番号が空だと購入できないこと" do
      
    end
  end
end
