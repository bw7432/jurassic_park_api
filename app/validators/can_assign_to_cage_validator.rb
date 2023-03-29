class CanAssignToCageValidator < ActiveModel::Validator
  def validate(record)
    case record.species.type_of
    when 'carnivore'
      record.errors.add :base, 'cannot add carnivore to herbivore cage' if contains_herbivore(record)
      if contains_carnivore_of_another_species(record)
        record.errors.add :base, 'cannot add carnivore to cage with other species of carnivore'
      end
    when 'herbivore'
      record.errors.add :base, 'cannot add herbivore to carnivore cage' if contains_carnivore(record)
    end
  end

  def contains_carnivore(record)
    record.cage.dinosaurs.joins(:species).where(species: { type_of: 'carnivore'}).exists?
  end

  def contains_herbivore(record)
    record.cage.dinosaurs.joins(:species).where(species: { type_of: 'herbivore'}).exists?
  end

  def contains_carnivore_of_another_species(record)
    record.cage.dinosaurs.joins(:species).where(species: { type_of: 'carnivore'})
    .where.not(species: { name: record.species.name }).exists?
  end
end