FactoryBot.define do
  factory :item do
    name {'テスト'}
    description {'テスト'}
    category_id {'2'}
    condition_id {'2'}
    payment_type_id {'2'}
    prefecture_id {'2'}
    shipment_term_id {'2'}
    price {'300'}

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png', content_type: 'image/png')
    end
  end
end
