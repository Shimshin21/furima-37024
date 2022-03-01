FactoryBot.define do
  factory :buyer_shipping_address do

    post_code { '1234567' }
    prefecture { 1 }
    city { '東京都' }
    address { '中央区' }
    building_name { 'テックキャンプビル' }
    tell_number { '09012345678' }
    
  end
end
