require 'rails_helper'

RSpec.describe "commnents/index", type: :view do
  before(:each) do
    assign(:commnents, [
      Commnent.create!(),
      Commnent.create!()
    ])
  end

  it "renders a list of commnents" do
    render
  end
end
