class User < ApplicationRecord
    has_many :notes, dependent: :destroy
    has_many :active_relationships, class_name:  "Relationship",
             foreign_key: "follower_id",
             dependent:   :destroy
    has_many :passive_relationships, class_name:  "Relationship",
             foreign_key: "followed_id",
             dependent:   :destroy
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower
    before_save { email.downcase! }
    mount_uploader :picture, ProfileImageUploader
    validates :name, presence: true
    validates :email, presence: true
    validates :name,  presence: true, length: { maximum: 50 }
     VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                                format: { with: VALID_EMAIL_REGEX },
                                uniqueness: {case_sensitive: false}
    has_secure_password
    validates :password, presence:true, length: { minimum: 4}, allow_nil:true
    validate  :picture_size
    # ユーザーをフォローする
    def follow(other_user)
        active_relationships.create(followed_id: other_user.id)
    end

    # ユーザーをフォロー解除する
    def unfollow(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
    end

    # 現在のユーザーがフォローしてたらtrueを返す
    def following?(other_user)
        following.include?(other_user)
    end

    # ユーザーのステータスフィードを返す
    def feed
        following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
        Note.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
    end

    private
    def picture_size
        if picture.size > 5.megabytes
            errors.add(:picture, "5MB以下でお願いします！")
        end
    end
end
