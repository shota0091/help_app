class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: { message: 'を入力してください' }
  validates :age, numericality: { greater_than_or_equal_to:18 ,message: "は18歳以上を入力してください"}
  def self.guest
    find_or_create_by!(name: 'ゲスト',email: 'guest@example.com',age: "20") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
