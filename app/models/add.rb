class Add < ApplicationRecord
  belongs_to :user
  has_many :comments
  mount_uploader :img, ImageUploader
end
