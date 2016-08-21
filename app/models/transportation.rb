class Transportation < ApplicationRecord
  belongs_to :trip, dependent: :destroy

  validates :transportation_type, presence: true
  validates :departure_datetime, presence: true
  validates :arrival_datetime, presence: true
  validates :reference_number, presence: true
  validates :price, presence: true

  def price_per_personne
    self.price / self.trip.person_number
  end
end
