class User < ApplicationRecord
  validates :name, :email, :address, :age, presence: true
  validates :age, numericality: true, inclusion: { in: 0..100, message: " : 0~100歳の範囲で入力してください" }, allow_blank: true
  validate :picture_size
  mount_uploader :picture, PictureUploader
  
  private
  
  def picture_size
    if picture.size > 4.7.megabytes
      errors.add(:picture, "のファイルサイズは5MB未満にしてください")
    end
  end
end
