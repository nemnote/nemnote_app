class Image < ApplicationRecord
  belongs_to :user
  belongs_to :note,optional: true
  private
end
