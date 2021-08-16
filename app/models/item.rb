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

    validates :price, allow_blank: true, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' },
                      format: { with: /\A[0-9]+\z/ }
    validates :price, allow_blank: true,
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
    validates :price
  end
end
