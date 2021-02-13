class Choice < ApplicationRecord
  # 関連
  belongs_to :question

  # バリデーション
  validates :content,         presence: true,
                              length: { maximum: 20 }
  validates :question,        presence: true

  # メソッド
  def choice_score_percentage
    total = 0
    question.choices.each do |choice|
      total += choice.ans_cnt
    end
    if ans_cnt
      ((ans_cnt.to_f/total)*100).round(1)
    else
      0.0
    end
  end
end
