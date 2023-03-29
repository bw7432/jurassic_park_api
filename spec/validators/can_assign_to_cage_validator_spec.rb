require 'spec_helper'
require 'rails_helper'
require 'active_model'

RSpec.describe CanAssignToCageValidator do
  describe 'add a dinosaur' do

    let!(:velociraptor) { create(:species, name: 'Velociraptor', type_of: 'carnivore') }
    let!(:tyrannosaurus) { create(:species, name: 'Tyrannosaurus', type_of: 'carnivore') }
    let!(:brachiosaurus) { create(:species, name: 'Brachiosaurus', type_of: 'herbivore') }
    let!(:triceratops) { create(:species, name: 'Triceratops', type_of: 'herbivore') }

    let!(:herbivore_cage) { create(:cage, name: 'Herbivore Cage') }
    let!(:carnivore_cage) { create(:cage, name: 'Carnivore Cage') }

    let!(:empty_cage) { create(:cage, name: 'Empty Cage') }

    let!(:velociraptor_cage) { create(:cage, name: 'Velociraptor Cage') }
    let!(:tyrannosaurus_cage) { create(:cage, name: 'tyrannosaurus Cage') }

    before(:each) do
      create(:dinosaur, name: 'velociraptor_tom', cage: velociraptor_cage, species: velociraptor)

      create(:dinosaur, name: 'tyrannosaurus_ron', cage: tyrannosaurus_cage, species: tyrannosaurus)

      create(:dinosaur, name: 'brachiosaurus_doe', cage: herbivore_cage, species: brachiosaurus)

      create(:dinosaur, name: 'Triceratops_willy', cage: herbivore_cage, species: triceratops)
    end

    it 'should allow dinosaurs to added to empty cages' do

      # validate both against an empty cage
      herbivore_empty_cage = Dinosaur.new(name: 'herbivore Jim', species: brachiosaurus, cage: empty_cage)
      expect(herbivore_empty_cage).to be_valid

      carnivore_empty_cage = Dinosaur.new(name: 'Predator Bill', species: velociraptor, cage: empty_cage)
      expect(herbivore_empty_cage).to be_valid
    end

    it 'should allow herbivores to be added to cages with that contain herbivores' do
      triceratops_2 = Dinosaur.new(name: 'herbivore James', species: triceratops, cage: herbivore_cage)
      expect(triceratops_2).to be_valid
    end


    it 'shoud allow only carnivores of the same species to be in a cage' do
      # add another velociraptor to the velociraptor cage
      velociraptor_2 = Dinosaur.new(name: 'Velociraptor 2', species: velociraptor, cage: velociraptor_cage)
      expect(velociraptor_2).to be_valid

      # add another herbivore to the herbivore cage
      tyrannosaurus_2 = Dinosaur.new(name: 'Tyrannosaurus Terry', species: tyrannosaurus, cage: velociraptor_cage)
      expect(tyrannosaurus_2).not_to be_valid

    end

    it 'should not allow adding a carnivore to an herbivore cage' do
      velociraptor_3 = Dinosaur.new(name: 'Velociraptor 3', species: velociraptor, cage: herbivore_cage)
      expect(velociraptor_3).not_to be_valid
    end

      # try adding a velociraptor to the tyrannosaurus cage
      # velociraptor_3 = Dinosaur.new(name: 'Velociraptor 2', species: velociraptor, cage: tyrannosaurus_cage)
      # expect(velociraptor_3).not_to be_valid

      # velociraptor_1 = Dinosaur.new(name: 'Predator', species: velociraptor, cage: velociraptor_cage)
      # expect(velociraptor_1).to be_valid

      # velociraptor_2 = Dinosaur.new(name: 'Predator', species: velociraptor, cage: velociraptor_cage)
      # expect(velociraptor_2).to be_valid

      # only allow velociraptors to be added to the velociraptor cage
      # tyrannosaurus_1 = Dinosaur.new(name: 'Predator', species: tyrannosaurus, cage: velociraptor_cage)
      # expect(tyrannosaurus_1).not_to be_valid
      
      # binding.break


      # do not allow a carnivote to be added to a cage with an herbivore

      # do not allow an herbivore to be added to a cage that contains a carnivore
      # brachiosaurus_1 = Dinosaur.new(name: 'Prey', species: brachiosaurus, cage: velociraptor_cage)
      # expect(brachiosaurus_1).not_to be_valid


    # end
  end
end