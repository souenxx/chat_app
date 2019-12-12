class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  before_save {self.email=email.downcase}
  validates :name,presence: true, length:{maximum:50}
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,presence: true, length:{maximum:255},
             format:{with: VALID_EMAIL_REGEX},
             uniqueness: {case_sensitive: false}
  has_secure_password
  mount_uploader :picture, PictureUploader
  validates :password, presence: true,length:{minimum:6}
  validate :picture_size
  
  private
    #アップロードする画像サイズを制限
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
  
end
