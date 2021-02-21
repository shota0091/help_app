class Chat < ApplicationRecord
  belongs_to :messenger, class_name: "User"
  belongs_to :messenging, class_name: "User"
  mount_uploader :image, ImageUploader
end
