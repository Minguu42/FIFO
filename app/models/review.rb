class Review < ApplicationRecord
  belongs_to :user
  belongs_to :hackathon
  has_one_attached :image

  validates :title, presence: true, length: {maximum: 200}
  validates :role, presence: true, length: {maximum: 200}
  validates :level, presence: true
  validates :comment, presence: true
  validates :image, content_type: {in: %w[image/jpeg image/gif image/png],
                                   message: "must be a valid image format"},
            size: {less_than: 5.megabytes,
                   message: "should be less than 5MB"}

  def display_image
    image.variant(resize_to_limit: [275, 275])
  end
end
