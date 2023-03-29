require 'rails_helper'

RSpec.describe "cages/edit", type: :view do
  let(:cage) {
    Cage.create!(
      name: "MyString",
      power_status: 1,
      max_occupancy: 1
    )
  }

  before(:each) do
    assign(:cage, cage)
  end

  it "renders the edit cage form" do
    render

    assert_select "form[action=?][method=?]", cage_path(cage), "post" do

      assert_select "input[name=?]", "cage[name]"

      assert_select "input[name=?]", "cage[power_status]"

      assert_select "input[name=?]", "cage[max_occupancy]"
    end
  end
end
