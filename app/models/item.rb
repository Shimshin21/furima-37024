class Item < ApplicationRecord
  has_one    :buyer
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end




#belongs_to_active_hash :category
#belongs_to_active_hash :item_condition
#belongs_to_active_hash :shipping_cost
#belongs_to_active_hash :prefecture
#belongs_to_active_hash :shipping_days