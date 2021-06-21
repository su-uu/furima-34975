FactoryBot.define do
  factory :product do
    title            { Faker::Lorem.sentence }
    describe         { Faker::Lorem.sentence }
    category_id      { Faker::Number.between(from: 2, to: 11) }
    status_id        { Faker::Number.between(from: 2, to: 7) }
    delivery_id      { Faker::Number.between(from: 2, to: 3) }
    prefectures_id   { Faker::Number.between(from: 2, to: 48) }
    shipping_date_id { Faker::Number.between(from: 2, to: 4) }
    price            { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
