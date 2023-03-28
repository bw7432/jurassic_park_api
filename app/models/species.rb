class Species < ApplicationRecord

  enum type_of: {
    herbivore: 0,
    carnivore: 1
  }
end
