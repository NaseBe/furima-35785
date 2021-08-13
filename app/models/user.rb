class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :surname_kanji,
              format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true, message: 'is invalid. Input full-width characters.' }
    validates :name_kanji,
              format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true, message: 'is invalid. Input full-width characters.' }
    validates :surname_kana,
              format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true, message: 'is invalid. Input full-width katakana characters.' }
    validates :name_kana,
              format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true, message: 'is invalid. Input full-width katakana characters.' }
    validates :birthday
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, allow_blank: true, message: 'is invalid. Include both letters and numbers'
end
