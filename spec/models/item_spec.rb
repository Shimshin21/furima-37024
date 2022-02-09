require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it 'imageとnameとdescriptionとcategoryとitem_conditionとshipping_costとprefectureとshipping_daysとpriceが適切に入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it '商品説明が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'カテゴリーが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態が空では登録できない' do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition can't be blank"
      end

      it '配送料の負担が空では登録できない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
      end

      it '発送元の地域が空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '発送までの日数が空では登録できない' do
        @item.shipping_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping days can't be blank"
      end

      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid'
      end
    end
  end
end
