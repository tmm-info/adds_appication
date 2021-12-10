require 'rails_helper'

RSpec.describe "commnents/new", type: :view do
  before(:each) do
    assign(:commnent, Commnent.new())
  end

  it "renders new commnent form" do
    render

    assert_select "form[action=?][method=?]", commnents_path, "post" do
    end
  end
end
