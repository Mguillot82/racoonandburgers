class Racoon < ApplicationRecord
  belongs_to :user
  has_one :service
  has_many :disponibilities
  has_many :reservations

  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
