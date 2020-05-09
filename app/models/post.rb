class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validate :image_presence
  # Posts
  has_many :comments, dependent: :destroy
  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
