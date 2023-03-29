class Species < ApplicationRecord
  has_many :dinosaurs

  validates :name, presence: true
  validates :type_of, presence: true

  enum type_of: {
    herbivore: 0,
    carnivore: 1
  }
end
