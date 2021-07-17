FactoryBot.define do
  factory :buy_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code     { '123-4567' }
    prefecture_id   { 2 }
    city            { '豊島区' }
    street          { '西池袋1-1' }
    building        { '池袋ビル101' }
    tel             { '09012345678' }
    association :user
  end
end
