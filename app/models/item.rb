class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :prefecture
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :shipping_days
  
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_days_id, numericality: { other_than: 1 , message: "can't be blank"}

  has_one    :buyer
  belongs_to :user

  has_one_attached :image
  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end




      #t.string  :name, null: false
      #t.text :description, null: false
      #t.integer :price, null: false