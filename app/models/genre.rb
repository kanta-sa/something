class Genre < ApplicationRecord
  # 関連
  has_many :questions
end
