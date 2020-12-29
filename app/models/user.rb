class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: { message: 'を入力してください' }
  validates :age, numericality: { greater_than_or_equal_to:18 ,message: "は18歳以上を入力してください"}

  has_many :posts, dependent: :destroy
end
