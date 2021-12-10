require 'rails_helper'

RSpec.describe "adds/edit", type: :view do
  before(:each) do
    @add = assign(:add, Add.create!())
  end

  it "renders the edit add form" do
    render

    assert_select "form[action=?][method=?]", add_path(@add), "post" do
    end
  end
end
