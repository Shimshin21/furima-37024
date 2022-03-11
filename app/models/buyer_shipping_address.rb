class BuyerShippingAddress
  include ActiveModel::Model

  # ゲッターとセッターの設定ができる。２つのモデルのバリデーションを記述する。
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :tell_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :tell_number, format: { with: /\A[0-9]+\z/ }
  end
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :tell_number, format: { with: /\A\d{10,11}\z/, message: 'of characters is invalid.' }


  def save
    shipping_address = ShippingAddress.create(item_id: item_id, user_id: user_id)
    Buyer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,
                 tell_number: tell_number, shipping_address_id: shipping_address.id)
  end
end


shimpei
19881111


test10@test
qwe123


test20@test
qwe123


