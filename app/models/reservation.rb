class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :racoon, dependent: :destroy
  belongs_to :disponibility, dependent: :destroy
  enum :status, %i[pending cancelled declined accepted payment_due paid]
  scope :racoon_reservations, ->(racoon_id) { where("racoon_id = ?", racoon_id) }
end
