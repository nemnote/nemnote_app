class Note < ApplicationRecord
    belongs_to :user, optional: true
    has_many :images,dependent: :destroy
    accepts_nested_attributes_for :images, allow_destroy: true
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence:true
    validates :content, presence: true
end
