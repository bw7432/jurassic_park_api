require 'rails_helper'

RSpec.describe "cages/show", type: :view do
  before(:each) do
    assign(:cage, Cage.create!(
      name: "Name",
      power_status: 2,
      max_occupancy: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
