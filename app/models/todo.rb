class Todo < ApplicationRecord
  # 関連
  belongs_to :category

  # バリデーション
  validates :title,     presence: true,
                        length: { maximum: 20 }
  validates :content,   presence: true,
                        length: { maximum: 255 }
end
