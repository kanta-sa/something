class Category < ApplicationRecord
  # 関連
  belongs_to :user
  has_many :todos
end
