class Dinosaur < ApplicationRecord
  include Filterable
  
  belongs_to :cage
  belongs_to :species

  validates :name, presence: true
  validates :cage, presence: true
  validates :species, presence: true
  validates_with CanAssignToCageValidator

  # filtering scopes
  scope :by_species, -> (species) { joins(:species).where('lower(species.name) = ?', species.try(:downcase) ) }

  scope :by_type_of, -> (type_of) { joins(:species).where(species: { type_of: type_of.try(:downcase)}) }

  scope :by_cage_id, -> (cage_id) { where(cage_id: cage_id) }

  # query by type_of
  scope :carnivores, -> { joins(:species).where(species: { type_of: 'carnivore'}) }

  scope :herbivores, -> { joins(:species).where(species: { type_of: 'herbivore'}) }
end
