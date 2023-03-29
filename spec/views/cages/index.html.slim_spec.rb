require 'rails_helper'

RSpec.describe "cages/index", type: :view do
  before(:each) do
    assign(:cages, [
      Cage.create!(
        name: "Name",
        power_status: 2,
        max_occupancy: 3
      ),
      Cage.create!(
        name: "Name",
        power_status: 2,
        max_occupancy: 3
      )
    ])
  end

  it "renders a list of cages" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end
