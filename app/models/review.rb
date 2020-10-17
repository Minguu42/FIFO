class Review < ApplicationRecord
  validates :title, presence: true, length: {maximum: 200}
  validates :role, presence: true, length: {maximum: 200}
  validates :level, presence: true
  validates :comment, presence: true
end
