class Dinosaur < ApplicationRecord
  
  belongs_to :cage
  belongs_to :species

  validates :name, presence: true
  validates :cage, presence: true
  validates :species, presence: true
  validates_with CanAssignToCageValidator

  scope :by_species, -> (species) { joins(:species).where('lower(species.name) = ?', species.try(:downcase) ) }
end
