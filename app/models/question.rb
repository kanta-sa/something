class Question < ApplicationRecord
  # 関連
  belongs_to :user
  belongs_to :genre
  has_many :user_questions
  has_many :users, through: :user_questions
  has_many :choices
  accepts_nested_attributes_for :choices, allow_destroy: true, reject_if: :all_blank

  # バリデーション
  validates :title,         presence: true,
                            length: { maximum: 30 }
  # validates :answered,    presence: true
  validates :user,          presence: true
  validates :genre,         presence: true

  # メソッド
  def user_answered?(user)
    users.include?(user)
  end

  def answer_question(user)
    user_questions.find_or_create_by(user_id: user.id)
  end

  def total_ans_cnt
    choices.sum(:ans_cnt)
  end
end
