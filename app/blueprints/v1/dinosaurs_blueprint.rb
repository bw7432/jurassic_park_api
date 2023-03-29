module V1
  class DinosaursBlueprint < Blueprinter::Base
    identifier :id

    fields :id, :name
    association :cage, blueprint: V1::CagesBlueprint
    association :species, blueprint: V1::SpeciesBlueprint

  end
end