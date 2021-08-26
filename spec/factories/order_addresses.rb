FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '杉並区' }
    address { '永福１−１−１' }
    building { 'リバーサイドハイツ' }
    phone_number { '08000001111' }
    token { 'tok_e261ea40e90cbf7a25ce5059d000' }

    association :user
    association :item
  end
end
