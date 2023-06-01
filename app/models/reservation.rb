class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :racoon
  belongs_to :disponibility
  validates :status, presence: true, inclusion: { in: %w[pending cancelled declined accepted payment_due paid] }
end
