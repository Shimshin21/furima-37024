FactoryBot.define do
  factory :buyer_shipping_address do

    token { '1234567' }

    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '中央区' }
    building_name { 'テックキャンプビル' }
    tell_number { '09012345678' }
  end
end
