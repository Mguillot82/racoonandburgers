class Disponibility < ApplicationRecord
  belongs_to :racoon
  validates :date, presence: true
  scope :racoon_disponibilities, ->(racoon_id) { where("racoon_id = ?", racoon_id) }
end
