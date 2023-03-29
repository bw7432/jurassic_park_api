require 'rails_helper'

RSpec.describe "dinosaurs/show", type: :view do
  before(:each) do
    assign(:dinosaur, Dinosaur.create!(
      name: "Name",
      cage: nil,
      species: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
