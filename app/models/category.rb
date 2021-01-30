class Category < ApplicationRecord
  # 関連
  belongs_to :user
  has_many :todos
  accepts_nested_attributes_for :todos, allow_destroy: true

  # バリデーション
  validates :name,        presence: true
end
