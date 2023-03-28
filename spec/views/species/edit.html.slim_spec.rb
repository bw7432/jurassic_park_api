require 'rails_helper'

RSpec.describe "species/edit", type: :view do
  let(:species) {
    Species.create!(
      name: "MyString",
      type_of: 1
    )
  }

  before(:each) do
    assign(:species, species)
  end

  it "renders the edit species form" do
    render

    assert_select "form[action=?][method=?]", species_path(species), "post" do

      assert_select "input[name=?]", "species[name]"

      assert_select "input[name=?]", "species[type_of]"
    end
  end
end
