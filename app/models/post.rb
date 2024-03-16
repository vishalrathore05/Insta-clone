class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many :likes, dependent: :destroy


def liked_by?(user)
    likes.exists?(user: user)
  end
end
