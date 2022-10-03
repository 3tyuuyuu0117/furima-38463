FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {Faker::Internet.free_email}
    password              {'aaaaa1'}
    encrypted_password    {'aaaaa1'}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birthday              {'1930/01/01'}
  end
end