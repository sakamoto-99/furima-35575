FactoryBot.define do
  factory :product do
    title              { 'オムライス' }
    description        { 'オムライスです。' }
    category_id        {2}
    status_id          {2}
    delivery_charge_id {2}
    prefecture_id      {2}
    day_to_ship_id     {2}
    price              { '1000' }
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
