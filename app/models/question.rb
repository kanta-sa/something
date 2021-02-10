class Question < ApplicationRecord
  # 関連
  belongs_to :user

  # バリデーション
  validates :title,         presence: true,
                            length: { maximum: 30 }
  validates :answered,      presence: true
  validates :user,          presence: true
end
