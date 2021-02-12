# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..3).map do |i|
  User.create!(
    email: "user#{i}@example.com",
    password: 'password',
    password_confirmation: 'password'
  )
end

# 一人目のユーザーだけに子モデル追加
user = User.first
user.categories.create!(
  (1..rand(4..6)).map do |i|
    {
      name: "カテゴリー名_#{i}",
      todos_attributes:
        (1..rand(2..3)).map do |j|
          {
            title: "todo_#{i}_#{j}",
            content: "内容_#{i}_#{j}"
          }
        end
    }
  end
)

questionnaire = [
  { title: '好きな食べ物は？', choices_attributes: {
    0 => { content: '中華' },
    1 => { content: '洋食' },
    2 => { content: '和食' }
  } },
  { title: '犬派、猫派？', choices_attributes: {
    0 => { content: '犬派' },
    1 => { content: '猫派' }
  } },
  { title: '好きなカフェは？', choices_attributes: {
    0 => { content: 'Starbucks' },
    1 => { content: "Tully's" },
    2 => { content: 'ドトール' },
    3 => { content: 'その他' }
  } }
]

questionnaire.each do |q|
  user.questions.create!(q)
end
