require 'rails_helper'

RSpec.describe "species/new", type: :view do
  before(:each) do
    assign(:species, Species.new(
      name: "MyString",
      type_of: 1
    ))
  end

  it "renders new species form" do
    render

    assert_select "form[action=?][method=?]", species_index_path, "post" do

      assert_select "input[name=?]", "species[name]"

      assert_select "input[name=?]", "species[type_of]"
    end
  end
end
