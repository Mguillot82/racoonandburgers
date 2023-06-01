class Racoon < ApplicationRecord
  belongs_to :user
  has_one :service
  has_many :disponibilities
  has_many :reservations

  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }

  include PgSearch::Model
  pg_search_scope :search,
    associated_against: {
      user: [:username, :city, :address],
      service: [:title, :description, :item]
    },
    using: {
      tsearch: { prefix: true }
    }
end
