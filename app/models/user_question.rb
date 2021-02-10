class UserQuestion < ApplicationRecord
  # 関連
  belongs_to :user
  belongs_to :question

  # バリデーション
  validates :user,          presence: true
  validates :question,      presence: true
end
