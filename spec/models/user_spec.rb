require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "全ての情報が正しく記入されていたら登録できること" do
      expect(@user).to be_valid
    end

    it "ニックネームが必須であること" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "メールアドレスが必須であること" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスは、@を含む必要があること" do
      @user.email = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    
    it "パスワードが必須であること" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = "123ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは、半角英数字混合での入力が必須であること" do
      @user.password = "aaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "パスワードは、確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      @user.password = "123abcd"
      @user.password_confirmation = "123abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "ユーザー本名は、名字が必須であること" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "ユーザー本名は、名前が必須であること" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.last_name = "aaaaa"
      @user.first_name = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid", "First name is invalid")
    end

    it "ユーザー本名のフリガナは、名字が必須であること" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "ユーザー本名のフリガナは、名字が必須であること" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.last_name_kana = "aaaaa"
      @user.first_name_kana = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid", "First name kana is invalid")
    end

    it "生年月日が必須であること" do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end

