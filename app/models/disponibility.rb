class Disponibility < ApplicationRecord
  belongs_to :racoon
  validates :date, presence: true
  validates :status, presence: true, inclusion: { in: %w[available reserved] }
  scope :racoon_disponibilities, ->(racoon_id) { where("racoon_id = ?", racoon_id) }

  def self.available_disponibilities(racoon_id)
    @disponibilities = Disponibility.where(racoon_id: racoon_id, status: 'available')
  end
end
