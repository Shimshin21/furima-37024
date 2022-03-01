require 'rails_helper'

RSpec.describe BuyerShippingAddress, type: :model do

before do
  #user = FactoryBot.create(:user)
  @buyer_shipping_address = FactoryBot.build(:buyer_shipping_address)
end

#, user_id: user.id

describe '購入情報の保存' do

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buyer_shipping_address).to be_valid
    end
    #it 'building_nameは空でも保存できること' do
      #buyer_shipping_address = FactoryBot.build(:buyer_shipping_address)
      #buyer_shipping_address.building_name = ''
      #buyer_shipping_address.valid?
      #expect(buyer_shipping_address.errors.full_messages).to include "Email can't be blank"
    #end
  end
end

#context '内容に問題がある場合' do

  #it 'post_codeがからであれば保存できない' do
    #buyer_shipping_address = FactoryBot.build(:buyer_shipping_address)
    #buyer_shipping_address.post_code = ''
    #buyer_shipping_address.valid?
    #expect(buyer_shipping_address.errors.full_messages).to include "Postcode can't be blank"
  #end
#end

end



  #post_code, { '123-4567' }
  #prefecture { 1 }
  #city { '東京都' }
  #address { '中央区' }
  #building_name { '' }
  #tell_number { '09012345678' }

#postal_codeが空だと保存できないこと
#postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと
#prefectureを選択していないと保存できないこと
#priceが空だと保存できないこと
#priceが全角数字だと保存できないこと
#priceが1円未満では保存できないこと
#priceが1,000,000円を超過すると保存できないこと
#userが紐付いていないと保存できないこと
