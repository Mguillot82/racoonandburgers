class Disponibility < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  scope :user_disponibilities, ->(user_id) { where("user_id = ?", user_id) }
end
