FactoryBot.define do
  factory :todo, class: Todo do
    title { 'タイトル' }
    content { '内容' }
    association :category
  end
end