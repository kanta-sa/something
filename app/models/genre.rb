class Genre < ApplicationRecord
  # 関連
  has_many :questions

  # バリデーション
  validates :name,      presence: true,
                        length: { maximum: 20 }
end
