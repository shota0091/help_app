class Post < ApplicationRecord
  validates :title, presence: true
  validates :explanation, presence: {message: 'を投稿してください'}
  validates :image, presence: true
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments,dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :address
  belongs_to_active_hash :license

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name: old_name)
    end

    new_tags.each do |new_name|
      new_post_tag = Tag.find_or_create_by(tag_name: new_name)
      self.tags << new_post_tag
    end
  end
end



