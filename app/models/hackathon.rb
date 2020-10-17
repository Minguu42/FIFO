class Hackathon < ApplicationRecord
  validates :name, presence: true, length: {maximum: 200}
  validates :holding_time, length: { minimum: 1, maximum: 4}
end
