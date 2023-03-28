require 'rails_helper'

RSpec.describe "species/show", type: :view do
  before(:each) do
    assign(:species, Species.create!(
      name: "Name",
      type_of: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
