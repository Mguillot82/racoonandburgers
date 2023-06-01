class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :racoon
  belongs_to :disponibility, dependent: :destroy
  validates :status, presence: true, inclusion: { in: %w[pending cancelled declined accepted payment_due paid] }
  scope :racoon_reservations, ->(racoon_id) { where("racoon_id = ?", racoon_id) }
end
