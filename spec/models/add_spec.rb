require 'rails_helper'
require File.expand_path('../config/environment', __dir__)
RSpec.describe Add, type: :model do
  it "has a valid factory" do
    #person = FactoryGirl.build(:person) it is also valid
    expect(FactoryBotRails.build(:add)).to be_valid
  end
  it "is invalid without a name" do
    add = FactoryBotRails.build(:add, title: nil)
    expect(add).not_to be_valid
  end

  it "is invalid without an age" do
    add = FactoryBotRails.build(:add, body: nil)
    expect(add).not_to be_valid
  end

  it "returns a person's identifier as a string" do
    add = FactoryGirl.build(:add, title: "New add", body: "new body")
    expect(add.identifier).to eq("New add new body")
  end

end
