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
  has_many :reviewers, through: :passive_reviews, source: :reviewing

  has_many :active_notifications, class_name: 'Notification', foreign_key: :visitor_id, dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: :visited_id, dependent: :destroy

  has_many :active_follows, class_name: "Like",foreign_key: :following_id
  has_many :followings, through: :active_follows, source: :follower
  has_many :passive_follows, class_name: "Like",foreign_key: :follower_id
  has_many :followers, through: :passive_follows, source: :following

  has_many :posts, dependent: :destroy
  has_many :comments,dependent: :destroy
  mount_uploader :image, ImageUploader

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :address

  has_many :entries
  has_many :rooms, through: :entries
  has_many :messages


  def self.guest
    find_or_create_by!(name: 'ゲスト',email: 'guest@example.com',age: 20) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def reviewed_by?(user)
    passive_reviews.find_by(reviewing_id: user.id).present?
  end

  def followed_by?(user)
    passive_follows.find_by(following_id: user.id).present?
  end

  def create_notification_follow!(current_user)
    follow = Notification.where(["visitor_id = ? and visited_id = ? and action = ?",current_user.id, id,'follow'])
    if follow.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

end
