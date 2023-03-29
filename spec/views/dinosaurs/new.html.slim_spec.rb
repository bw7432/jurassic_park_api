require 'rails_helper'

RSpec.describe "dinosaurs/new", type: :view do
  before(:each) do
    assign(:dinosaur, Dinosaur.new(
      name: "MyString",
      cage: nil,
      species: nil
    ))
  end

  it "renders new dinosaur form" do
    render

    assert_select "form[action=?][method=?]", dinosaurs_path, "post" do

      assert_select "input[name=?]", "dinosaur[name]"

      assert_select "input[name=?]", "dinosaur[cage_id]"

      assert_select "input[name=?]", "dinosaur[species_id]"
    end
  end
end
