class Image < ApplicationRecord
  belongs_to :note,optional: true
  mount_uploader :picture, PictureUploader
end
