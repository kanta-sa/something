class Question < ApplicationRecord
  # 関連
  belongs_to :user
  has_many :user_questions
  has_many :users, through: :user_questions
  has_many :choices
  accepts_nested_attributes_for :choices, allow_destroy: true, reject_if: :all_blank

  # バリデーション
  validates :title,         presence: true,
                            length: { maximum: 30 }
  # validates :answered,    presence: true
  validates :user,          presence: true
end
