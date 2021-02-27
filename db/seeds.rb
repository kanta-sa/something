N = 20 # ユーザー数
(1..N).map do |i|
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

genres = [
  { name: '食' },
  { name: '動物' },
  { name: '飲み物' },
  { name: 'スポーツ' },
  { name: '自然' },
  { name: 'その他' }
]

genres.each do |g|
  Genre.create!(g)
end

questionnaire = [
  [{ title: '好きな食べ物は？', choices_attributes: {
    0 => { content: '中華' },
    1 => { content: '洋食' },
    2 => { content: '和食' }
  } }, { genre_name: '食' }],
  [{ title: '犬派、猫派？', choices_attributes: {
    0 => { content: '犬派' },
    1 => { content: '猫派' }
  } }, { genre_name: '動物' }],
  [{ title: '好きなカフェは？', choices_attributes: {
    0 => { content: 'Starbucks' },
    1 => { content: "Tully's" },
    2 => { content: 'ドトール' },
    3 => { content: 'その他' }
  } }, { genre_name: '飲み物' }],
  [{ title: '好きなスポーツは？', choices_attributes: {
    0 => { content: '野球' },
    1 => { content: 'サッカー' },
    2 => { content: 'バスケットボール' },
    3 => { content: 'バレーボール' },
    4 => { content: 'テニス' },
    5 => { content: '卓球' },
    6 => { content: 'バドミントン' },
    7 => { content: 'その他' }
  } }, { genre_name: 'スポーツ' }],
  [{ title: '好きな季節は？', choices_attributes: {
    0 => { content: '春' },
    1 => { content: '夏' },
    2 => { content: '秋' },
    3 => { content: '冬' }
  } }, { genre_name: 'その他' }],
  [{ title: '山派or海派', choices_attributes: {
    0 => { content: '山' },
    1 => { content: '海' }
  } }, { genre_name: '自然' }]
]

questionnaire.each do |q|
  question = user.questions.build(q[0])
  question.genre_id = Genre.find_by(name: q[1][:genre_name]).id
  question.save
end

(5..N).each do |i|
  user = User.find(i)
  t = Array.new(rand(3..7)) { rand(1..Question.count) }.uniq
  t.each do |j|
    question = Question.find(j)
    choice = question.choices.sample
    choice.select_choice
    question.answer_question(user)
  end
end
