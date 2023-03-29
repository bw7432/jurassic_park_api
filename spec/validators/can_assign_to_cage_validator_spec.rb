require 'spec_helper'
require 'rails_helper'
require 'active_model'

RSpec.describe CanAssignToCageValidator do
  describe 'add a dinosaur' do

    let(:velociraptor) { create(:species, name: 'Velociraptor', type_of: 'carnivore') }
    let(:tyrannosaurus) { create(:species, name: 'Tyrannosaurus', type_of: 'carnivore') }
    let(:brachiosaurus) { create(:species, name: 'Brachiosaurus', type_of: 'herbivore') }
    let(:triceratops) { create(:species, name: 'Triceratops', type_of: 'herbivore') }

    let(:herbivore_cage) { create(:cage, name: 'Herbivore Cage') }
    let(:carnivore_cage) { create(:cage, name: 'Carnivore Cage') }

    let(:empty_cage) { create(:cage, name: 'Empty Cage') }

    let(:full_cage) { create(:cage, name: 'Full Cage', max_occupancy: 1) }

    let(:powered_off_cage) { create(:cage, name: 'Powered Off Cage', power_status: 'down')}

    let(:velociraptor_cage) { create(:cage, name: 'Velociraptor Cage') }
    let(:tyrannosaurus_cage) { create(:cage, name: 'tyrannosaurus Cage') }

    before(:each) do
      create(:dinosaur, name: 'velociraptor_tom', cage: velociraptor_cage, species: velociraptor)

      create(:dinosaur, name: 'tyrannosaurus_ron', cage: tyrannosaurus_cage, species: tyrannosaurus)

      create(:dinosaur, name: 'brachiosaurus_doe', cage: herbivore_cage, species: brachiosaurus)

      create(:dinosaur, name: 'Triceratops_willy', cage: herbivore_cage, species: triceratops)

      create(:dinosaur, name: 'Triceratops_andy', cage: full_cage, species: triceratops)
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

    it 'should not allow adding an herbivore to a cage that contains a carnivore' do
      triceratops_3 = Dinosaur.new(name: 'Triceratops 3', species: triceratops, cage: velociraptor_cage)
      expect(triceratops_3).not_to be_valid
    end

    it 'should not allow adding a dinosour to a cage that is powered off' do
      triceratops_3 = Dinosaur.new(name: 'Triceratops 3', species: triceratops, cage: powered_off_cage)
      expect(triceratops_3).not_to be_valid
    end

    it 'should not allow adding a dinosour to a full cage' do
      triceratops_4 = Dinosaur.new(name: 'Triceratops 4', species: triceratops, cage: full_cage)
      expect(triceratops_4).not_to be_valid
    end

  end
end