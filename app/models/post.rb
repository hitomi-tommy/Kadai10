class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belong_to :user
end
