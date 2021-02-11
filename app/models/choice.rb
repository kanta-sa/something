class Choice < ApplicationRecord
  # 関連
  belongs_to :question

  # バリデーション
  validates :content,         presence: true,
                              length: { maximum: 20 }
  validates :question,        presence: true
end
