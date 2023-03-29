require 'rails_helper'

RSpec.describe "dinosaurs/index", type: :view do
  before(:each) do
    assign(:dinosaurs, [
      Dinosaur.create!(
        name: "Name",
        cage: nil,
        species: nil
      ),
      Dinosaur.create!(
        name: "Name",
        cage: nil,
        species: nil
      )
    ])
  end

  it "renders a list of dinosaurs" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
