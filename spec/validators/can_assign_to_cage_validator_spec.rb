require 'spec_helper'
require 'rails_helper'
require 'active_model'

RSpec.describe CanAssignToCageValidator do
  describe 'add a dinosaur' do
    it 'not not allow a carvinore to be added to a cage with an herbivore' do
      velociraptor = create(:species, name: 'Velociraptor', type_of: 'carnivore')
      brachiosaurus = create(:species, name: 'Brachiosaurus', type_of: 'herbivore')
      herbivore_cage = create(:cage, name: 'Herbivore Cage')
      carnivore_cage = create(:cage, name: 'Carnivore Cage')
      empty_cage = create(:cage, name: 'Empty Cage')
      velociraptor_cage = create(:cage, name: 'Velociraptor Cage')

      velociraptor_1 = Dinosaur.new(name: 'Predator', species: velociraptor, cage: velociraptor_cage)
      expect(velociraptor_1).to be_valid
      
      # binding.break


      # do not allow a carnivote to be added to a cage with an herbivore

      # do not allow an herbivore to be added to a cage that contains a carnivore
      brachiosaurus_1 = Dinosaur.new(name: 'Prey', species: brachiosaurus, cage: velociraptor_cage)
      expect(brachiosaurus_1).not_to be_valid

      # only allow velociraptors to be added to the velociraptor cage

    end
  end
end