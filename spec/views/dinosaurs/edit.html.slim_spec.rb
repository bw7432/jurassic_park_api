require 'rails_helper'

RSpec.describe "dinosaurs/edit", type: :view do
  let(:dinosaur) {
    Dinosaur.create!(
      name: "MyString",
      cage: nil,
      species: nil
    )
  }

  before(:each) do
    assign(:dinosaur, dinosaur)
  end

  it "renders the edit dinosaur form" do
    render

    assert_select "form[action=?][method=?]", dinosaur_path(dinosaur), "post" do

      assert_select "input[name=?]", "dinosaur[name]"

      assert_select "input[name=?]", "dinosaur[cage_id]"

      assert_select "input[name=?]", "dinosaur[species_id]"
    end
  end
end
