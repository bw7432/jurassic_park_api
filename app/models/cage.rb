class Cage < ApplicationRecord
  include Filterable
  has_many :dinosaurs

  validates :name, presence: true

  enum power_status: {
    active: 0,
    down: 1
  }
  

  scope :by_power_status, -> (power_status) { where(power_status: power_status) }
end
