FactoryBot.define do
  factory :question do
    title { '' }
    answered { false }
    user { nil }
  end
end
