require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品ができる時' do
      it '必須項目を正しく入力すると出品できること' do
        expect(@item).to be_valid
      end
    end

    context '出品ができない時' do
      it 'imageが空では出品出できないこと' do
        @item.image = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では出品できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'category_idが空では出品できないこと' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが空では出品できないこと' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'payment_type_idが空では出品できないこと' do
        @item.payment_type_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment type can't be blank")
      end

      it 'prefecture_idが空では出品できないこと' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipment_term_idが空では出品できないこと' do
        @item.shipment_term_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment term can't be blank")
      end

      it 'priceが空では出品できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが全角数字では出品できないこと' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end

      it 'priceが文字では出品できないこと' do
        @item.price = '千'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end

      it 'priceが299円以下では出品できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが10000000円以上では出品できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end



    end
  end
end
