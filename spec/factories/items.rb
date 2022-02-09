FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    item_condition_id { 2 }
    shipping_cost_id { 2 }
    prefecture_id { 2 }
    shipping_days_id { 2 }
    price { '20000' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/IMG_1530.jpg'), filename: 'IMG_1530.jpg')
    end

    association :user
  end
end
