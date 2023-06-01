class Service < ApplicationRecord
  belongs_to :racoon

  validates :title, presence: true, length: {
    in: 6..32,
    wrong_length: "%{count} characters. Title must have between 6 and 32 characters "
  }
  validates :description, :item, presence: true, length: {
    maximum: 255,
    wrong_length: "%{count} characters. Title must have between 6 and 32 characters "
  }
  validates :price, presence: true, numericality: true
end
