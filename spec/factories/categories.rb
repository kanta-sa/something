FactoryBot.define do
  factory :category, class: Category do
    name { 'カテゴリー名' }
    association :user
  end
end