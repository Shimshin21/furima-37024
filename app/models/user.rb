class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :items
        has_many :buyers

        validates :nickname,  presence: true
        validates :email,     presence: true, uniqueness: true
        validates :password, presence: true, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

        validates :family_name, presence: true
        validates :first_name, presence: true
        validates :family_name_kana, presence: true, format: { :with KATAKANA_REGEXP }
        validates :first_name_kana, presence: true, format: { :with KATAKANA_REGEXP }
        validates :birth, presence: true
end

