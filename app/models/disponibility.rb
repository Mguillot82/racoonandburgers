class Disponibility < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  # test
end
