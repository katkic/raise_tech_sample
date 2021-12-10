class User < ApplicationRecord
  validates :name, :email, :address, :age, presence: true
  validates :age, numericality: true, inclusion: { in: 0..100, message: " : 0~100歳の範囲で入力してください" }, allow_blank: true
end
