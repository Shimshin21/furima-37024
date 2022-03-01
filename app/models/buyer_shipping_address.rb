class BuyerShippingAddress
  include ActiveModel::Model


  #ゲッターとセッターの設定ができる。２つのモデルのバリデーションを記述する。
  attr_accessor :post_code, :prefecture, :city, :address, :building_name, :tell_number, :user_id

  with_options presence: true do
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, presence: true
    validates :address, presence: true
    validates :tell_number, presence: true
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}


  def save

    shipping_address = ShippingAddress.create(item_id: item_id, user_id: user_id )
    Buyer.create(post_code: post_code, prefecture: prefecture, city: city, address: address, building_name: building_name, tell_number: tell_number, shipping_address_id: shipping_address.id )
  end
end



#shipping_addresses(マイグレーションファイルのバリデーション)
      #t.references :item, foreign_key: true
      #t.references :user, foreign_key: true

#buyer (マイグレーションファイルのバリデーション)
      #t.string     :post_code,   null: false
      #t.integer    :prefecture_id,    null: false
      #t.string     :city,    null: false
      #t.string     :address,    null: false 
      #t.string     :building_name
      #t.string     :tell_number,    null: false  
      
      #t.references :shipping_address, null: false, foreign_key: true

