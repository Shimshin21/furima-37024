class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :items
        has_many :buyers

        validates :nickname,  presence: true
        validates :email,     presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
        validates :encrypted_password, presence: true, format:{with: /(?=.[a-zA-Z])(?=.\d)[a-zA-Z\d]{6,}/}
        validates :family_name, presence: true
        validates :first_name, presence: true
        validates :family_name_kana, presence: true
        validates :first_name_kana, presence: true
        validates :birth, presence: true
end

