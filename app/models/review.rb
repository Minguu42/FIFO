class Review < ApplicationRecord
  belongs_to :user
  belongs_to :hackathon

  validates :title, presence: true, length: {maximum: 200}
  validates :role, presence: true, length: {maximum: 200}
  validates :level, presence: true
  validates :comment, presence: true
end
