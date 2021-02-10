class Question < ApplicationRecord
  # 関連
  belongs_to :user
  has_many :user_questions
  has_many :users, through: :user_questions

  # バリデーション
  validates :title,         presence: true,
                            length: { maximum: 30 }
  validates :answered,      presence: true
  validates :user,          presence: true
end
