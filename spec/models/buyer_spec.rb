require 'rails_helper'

RSpec.describe Buyer, type: :model do
  before do
    @buyer = FactoryBot.build(:buyer)
  end

  describe '購入情報の保存' do
  
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer).to be_valid
      end
    end
  
  end
end




      
      #it 'building_nameは空でも保存できること' do
        #buyer_shipping_address = FactoryBot.build(:buyer_shipping_address)
        #buyer_shipping_address.building_name = ''
        #buyer_shipping_address.valid?
        #expect(buyer_shipping_address.errors.full_messages).to include "Email can't be blank"
      #end
  
  #context '内容に問題がある場合' do
  
    #it 'post_codeがからであれば保存できない' do
      #buyer_shipping_address = FactoryBot.build(:buyer_shipping_address)
      #buyer_shipping_address.post_code = ''
      #buyer_shipping_address.valid?
      #expect(buyer_shipping_address.errors.full_messages).to include "Postcode can't be blank"
    #end
  #end