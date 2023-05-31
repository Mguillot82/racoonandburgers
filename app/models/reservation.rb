class Reservation < ApplicationRecord
  belongs_to :user
  enum :status, %i[pending cancelled declined accepted payment_due paid]
end
