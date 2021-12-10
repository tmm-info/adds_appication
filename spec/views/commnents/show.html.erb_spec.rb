require 'rails_helper'

RSpec.describe "commnents/show", type: :view do
  before(:each) do
    @commnent = assign(:commnent, Commnent.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
