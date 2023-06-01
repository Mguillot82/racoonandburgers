class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :racoon
  belongs_to :disponibility
  enum :status, %i[pending cancelled declined accepted payment_due paid]
end
