require 'rails_helper'

RSpec.describe "adds/index", type: :view do
  before(:each) do
    assign(:adds, [
      Add.create!(),
      Add.create!()
    ])
  end

  it "renders a list of adds" do
    render
  end
end
