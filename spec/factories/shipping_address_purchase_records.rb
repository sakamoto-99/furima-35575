FactoryBot.define do
  factory :shipping_address_purchase_record do
    postal_code       { '123-1234' }
    prefecture_id     { 15 }
    municipality      { '横浜市緑区' }
    address           { '青山1-1' }
    building_number   { '柳ビル103' }
    tel               { '09012345678' }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
