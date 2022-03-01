class Buyer < ApplicationRecord

  has_many :shipping_address
  belongs_to :user

end
