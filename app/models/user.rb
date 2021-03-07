class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: { message: 'を入力してください' }
  validates :age, numericality: { greater_than_or_equal_to:18 ,message: "は18歳以上を入力してください"}

  has_many :active_reviews, class_name: "Review",foreign_key: :reviewing_id
  has_many :reviewings, through: :active_reviews, source: :reviewer
  has_many :passive_reviews, class_name: "Review",foreign_key: :reviewer_id
  has_many :reviewers, through: :active_reviews, source: :reviewing

  has_many :posts, dependent: :destroy
  has_many :comments,dependent: :destroy
  mount_uploader :image, ImageUploader

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :address

  has_many :user_chat_rooms
  has_many :chat_rooms,through: :user_chat_rooms


  def self.guest
    find_or_create_by!(name: 'ゲスト',email: 'guest@example.com',age: 20) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def followed_by?(user)
    passive_reviews.find_by(reviewing_id: user.id).present?
  end

end
