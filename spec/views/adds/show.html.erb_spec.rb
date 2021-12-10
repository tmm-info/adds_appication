require 'rails_helper'

RSpec.describe "adds/show", type: :view do
  before(:each) do
    @add = assign(:add, Add.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
