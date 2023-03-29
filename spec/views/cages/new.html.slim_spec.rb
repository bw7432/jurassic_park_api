require 'rails_helper'

RSpec.describe "cages/new", type: :view do
  before(:each) do
    assign(:cage, Cage.new(
      name: "MyString",
      power_status: 1,
      max_occupancy: 1
    ))
  end

  it "renders new cage form" do
    render

    assert_select "form[action=?][method=?]", cages_path, "post" do

      assert_select "input[name=?]", "cage[name]"

      assert_select "input[name=?]", "cage[power_status]"

      assert_select "input[name=?]", "cage[max_occupancy]"
    end
  end
end
