module V1
  class CagesBlueprint < Blueprinter::Base
    identifier :id

    fields :id, :name, :power_status, :max_occupancy

  end
end