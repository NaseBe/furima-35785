class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :payment_type
  belongs_to :prefecture
  belongs_to :shipment_term
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :payment_type_id
      validates :prefecture_id
      validates :shipment_term_id
    end

    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, allow_blank: true, message: "is out of setting range" }, format: { with: /\A\d+\z/, allow_blank: true, message: "is invalid. Input half-width characters" }
  end
end
