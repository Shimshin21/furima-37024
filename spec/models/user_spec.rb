require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmationとfamily_name,first_name,family_name_kana,first_name_kanaが適切に入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end
    
    it 'emailが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@を含まないと登録できない' do
      @user.save
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passwordが半角英語のみでは登録できない' do
      user = FactoryBot.build(:user)
      user = FactoryBot.build(:user)
      user.password = 'aaaaaa'
      user.valid?
      expect(user.errors.full_messages).to include "Password is invalid"
    end

    it 'passwordが半角数字のみでは登録できない' do
      user = FactoryBot.build(:user)
      user = FactoryBot.build(:user)
      user.password = '111111'
      user.valid?
      expect(user.errors.full_messages).to include "Password is invalid"
    end

    it 'family_nameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.family_name = ''
      user.valid?
      expect(user.errors.full_messages).to include "Family name can't be blank"
    end

    it 'first_nameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include "First name can't be blank"
    end

    it 'family_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.family_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include "Family name kana can't be blank"
    end

    it 'first_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include "First name kana can't be blank"
    end

    it 'birthが空では登録できない' do
      user = FactoryBot.build(:user)
      user.birth = ''
      user.valid?
      expect(user.errors.full_messages).to include "Birth can't be blank"
    end

    end
  end
end