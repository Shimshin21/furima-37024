class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions



  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }


  belongs_to :prefecture
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :shipping_days
  
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_condition_id, presence: true,numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_days_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}

  has_one    :buyer
  belongs_to :user

  has_one_attached :image
  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end