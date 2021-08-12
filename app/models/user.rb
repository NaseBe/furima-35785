class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, presence: true
         validates :surname_kanji, presence: true
         validates :name_kanji, presence: true
         validates :surname_kana, presence: true
         validates :name_kana, presence: true
         validates :birthday, presence: true
end
