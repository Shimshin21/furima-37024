require 'rails_helper'

RSpec.describe BuyerShippingAddress, type: :model do
  before do
    @BuyerShippingAddress = FactoryBot.build(:buyer_shipping_address)
  end

  describe '購入情報の保存' do
  
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@BuyerShippingAddress).to be_valid
      end

      it 'building_nameが空でも保存できること' do
        @BuyerShippingAddress.building_name = ''
        expect(@BuyerShippingAddress).to be_valid
      end
    end

      context '内容に問題がある場合' do
        it 'post_codeが空であれば保存できない' do
          @BuyerShippingAddress.post_code = ''
          @BuyerShippingAddress.valid?
          expect(@BuyerShippingAddress.errors.full_messages).to include "Post code can't be blank"
        end

        it 'post_codeに-がなければ保存できない' do
          @BuyerShippingAddress.post_code = '1234567'
          @BuyerShippingAddress.valid?
          expect(@BuyerShippingAddress.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
        end


        it 'post_codeは7けたなければ保存できない' do
          @BuyerShippingAddress.post_code = '123-456'
          @BuyerShippingAddress.valid?
          expect(@BuyerShippingAddress.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
        end

        it 'post_codeのハイフンの位置が違うければ保存できない' do
          @BuyerShippingAddress.post_code = '12-34567'
          @BuyerShippingAddress.valid?
          expect(@BuyerShippingAddress.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
        end
        
        it 'prefecture_idが入力されていなければ保存できない' do
          @BuyerShippingAddress.prefecture_id =nil
          @BuyerShippingAddress.valid?
          expect(@BuyerShippingAddress.errors.full_messages).to include "Prefecture can't be blank"
        end

        it 'prefecture_idに---を選択すると登録できない' do
          @BuyerShippingAddress.prefecture_id = '0'
          @BuyerShippingAddress.valid?
          expect(@BuyerShippingAddress.errors.full_messages).to include "Prefecture can't be blank"
        end

        it 'cityが入力されていなければ保存できない' do
          @BuyerShippingAddress.city = ''
          @BuyerShippingAddress.valid?
          expect(@BuyerShippingAddress.errors.full_messages).to include "City can't be blank"
        end

        it 'addressが入力されていなければ保存できない' do
          @BuyerShippingAddress.address = ''
          @BuyerShippingAddress.valid?
          expect(@BuyerShippingAddress.errors.full_messages).to include "Address can't be blank"
        end

        it 'tell_numberが入力されていなければ保存できない' do
          @BuyerShippingAddress.tell_number = ''
          @BuyerShippingAddress.valid?
          expect(@BuyerShippingAddress.errors.full_messages).to include "Tell number can't be blank"
        end

        it 'tell_numberに全角数字が入力されていれば保存できない' do
          @BuyerShippingAddress.tell_number = '０９０１２３４５６７８'
          @BuyerShippingAddress.valid?
          expect(@BuyerShippingAddress.errors.full_messages).to include "Tell number is invalid"
        end

        it 'tell_numberが12けた以上入力されていれば保存できない' do
          @BuyerShippingAddress.tell_number = '090123456789'
          @BuyerShippingAddress.valid?
          expect(@BuyerShippingAddress.errors.full_messages).to include "Tell number of characters is invalid."
        end

        it 'tell_numberが9けた以下で入力されていれば保存できない' do
          @BuyerShippingAddress.tell_number = '090123456'
          @BuyerShippingAddress.valid?
          expect(@BuyerShippingAddress.errors.full_messages).to include "Tell number of characters is invalid."
        end


        it 'user_idが紐づいていないと保存できない' do
          @BuyerShippingAddress.user_id = nil
          @BuyerShippingAddress.valid?
          expect(@BuyerShippingAddress.errors.full_messages).to include "User can't be blank"
        end


        it 'item_idが紐づいていないと保存できない' do
          @BuyerShippingAddress.item_id = nil
          @BuyerShippingAddress.valid?
          expect(@BuyerShippingAddress.errors.full_messages).to include "Item can't be blank"
        end

        it 'tokenが紐づいていないと保存できない' do
          @BuyerShippingAddress.token = nil
          @BuyerShippingAddress.valid?
          expect(@BuyerShippingAddress.errors.full_messages).to include "Token can't be blank"
        end

      end
  
  end
end