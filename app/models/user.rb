class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: { message: 'を入力してください' }
  validates :age, numericality: { greater_than_or_equal_to:18 ,message: "は18歳以上を入力してください"}


  has_many :sctive_reviews, class_name: "Review", foreign_key: :reviewer_id
  has_many :reviewer, through: :active_reviews, source: :reviewing
  has_many :passvie_reviews, class_name: "Review", foreign_key: :reviewing_id
  has_many :reviewing, through: :active_reviews, source: :reviewer

  has_many :posts, dependent: :destroy
  has_many :comments,dependent: :destroy
  mount_uploader :image, ImageUploader

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :address


  def self.guest
    find_or_create_by!(name: 'ゲスト',email: 'guest@example.com',age: 20) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def reviewed_by?(user)
    passvie_reviews.find_by(reviewer_id: user.id).present?
  end
end
