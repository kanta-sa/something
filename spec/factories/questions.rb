FactoryBot.define do
  factory :question do
    title { "MyString" }
    answered { false }
    user { nil }
  end
end
