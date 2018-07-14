FactoryBot.define do
  factory :goal do
    user_id { 1 }
    description { 'eat healthy' }
    is_public { true }
  end
end
