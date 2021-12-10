require 'rails_helper'

RSpec.describe "commnents/edit", type: :view do
  before(:each) do
    @commnent = assign(:commnent, Commnent.create!())
  end

  it "renders the edit commnent form" do
    render

    assert_select "form[action=?][method=?]", commnent_path(@commnent), "post" do
    end
  end
end
