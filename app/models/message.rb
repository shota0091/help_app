class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_many :notifications, dependent: :destroy
  validates :messages, presence: true
  mount_uploader :image, MessageImageUploader
end
