require 'rails_helper'

RSpec.describe "adds/new", type: :view do
  before(:each) do
    assign(:add, Add.new())
  end

  it "renders new add form" do
    render

    assert_select "form[action=?][method=?]", adds_path, "post" do
    end
  end
end
