FactoryBot.define do
  factory :user do
    username { Faker::BreakingBad.character }
    password { 'password' }
  end
end
