FactoryBot.define do
  factory :user do
    nickname              { 'tarou' }
    email                 { Faker::Internet.free_email }
    password              { 'pass123' }
    password_confirmation { 'pass123' }
    first_name            { '太郎' }
    last_name             { '山田' }
    first_name_ruby       { 'タロウ' }
    last_name_ruby        { 'ヤマダ' }
    birthday              { '2000-01-01' }
  end
end
