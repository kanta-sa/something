class Genre < ApplicationRecord
  # 関連
  has_many :questions

  # バリデーション
  validates :name,      presence: true,
                        length: { maximum: 20 }

  # クラスメソッド
  def self.search(search)
    search.present? ? where(name: search) : all
  end
end
