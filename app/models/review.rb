class Review < ApplicationRecord
  belongs_to :reservation

  validates :content, presence: true, length: {
    minimum: 8,
    too_short: "%{count} characters is the minimum allowed"
  }
  validates :rating, presence: true, numericality: {
    in: 0..5,
    step: 0.5
  }
end
