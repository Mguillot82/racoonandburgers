class Racoon < ApplicationRecord
  belongs_to :user
  has_one :service
  has_many :disponibilities
  has_many :reservations
end
