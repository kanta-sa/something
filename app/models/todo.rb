class Todo < ApplicationRecord
  # モジュール
  extend Enumerize
  enumerize :status, in: [:yet, :done], default: :yet

  # 関連
  belongs_to :category

  # バリデーション
  validates :title,     presence: true,
                        length: { maximum: 20 }
  validates :content,   presence: true,
                        length: { maximum: 255 }
  validates :status,    presence: true
end
