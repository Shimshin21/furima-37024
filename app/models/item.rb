class Item < ApplicationRecord
  has_one    :buyer
  belongs_to :user
end

#belongs_to_active_hash :category
#belongs_to_active_hash :item_condition
#belongs_to_active_hash :shipping_cost
#belongs_to_active_hash :prefecture
#belongs_to_active_hash :shipping_days