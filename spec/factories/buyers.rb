FactoryBot.define do
  factory :buyer do
    post_code { '1234567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '中央区' }
    building_name { 'テックキャンプビル' }
    tell_number { '09012345678' }
  end
end
