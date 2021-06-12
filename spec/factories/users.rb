FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@test.com'}
    password              {'aaa111'}
    password_confirmation {'aaa111'}
    last_name             {'テスト苗字'}
    first_name            {'テスト名前'}
    last_name_kana        {'テストカナ'}
    first_name_kana       {'テストカナ'}
    birthday              {'1930-01-01'}
  end
end
