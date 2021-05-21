FactoryBot.define do
  factory :shipping_address_purchase_record do
    card_number       {'12345671234567'}
    month             {'1'}
    year              {'30'}
    cvv_cvc           {'123'}
    postal_code       { '123-1234' }
    prefecture_id     { 15 }
    municipality      { '横浜市緑区' }
    address           { '青山1-1' }
    building_number   { '柳ビル103' }
    tel               { '09012345678' }
  end
end
