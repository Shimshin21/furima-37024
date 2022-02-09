class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :buyers

  validates :nickname, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }

  validates :family_name_kana, presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/ }
  validates :first_name_kana, presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/ }
  validates :birth, presence: true
end
