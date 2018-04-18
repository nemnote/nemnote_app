class Note < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence:true
    validates :content, presence: true, length: { maximum: 140 }
    validate  :image_size

    private
    def image
        if image.size > 5.megabytes
            errors.add(:image, "5MB以下でお願いします！")
        end
    end
end
