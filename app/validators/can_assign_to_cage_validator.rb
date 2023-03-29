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
    record.errors.add :base, 'cage is powered off' if record.cage.power_status == 'down'

    record.errors.add :base, 'cage is full' if cage_is_full(record)
  end

  def contains_carnivore(record)
    record.cage.dinosaurs.carnivores.exists?
  end

  def contains_herbivore(record)
    record.cage.dinosaurs.herbivores.exists?
  end

  def contains_carnivore_of_another_species(record)
    record.cage.dinosaurs.carnivores.where.not(species: { name: record.species.name }).exists?
  end

  def cage_is_full(record)
    return false if record.cage.max_occupancy.blank?
    return true if record.cage.dinosaurs.count == record.cage.max_occupancy
  end
end