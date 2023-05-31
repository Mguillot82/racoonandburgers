class Disponibility < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  enum :status, %i[available reserved]
  scope :racoon_disponibilities, ->(racoon_id) { where("racoon_id = ?", racoon_id) }
end
