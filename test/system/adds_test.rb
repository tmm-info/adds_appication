require "application_system_test_case"

class AddsTest < ApplicationSystemTestCase
  setup do
    @add = adds(:one)
  end

  test "visiting the index" do
    visit adds_url
    assert_selector "h1", text: "Adds"
  end

  test "creating a Add" do
    visit adds_url
    click_on "New Add"

    fill_in "Body", with: @add.body
    fill_in "Img", with: @add.img
    fill_in "Title", with: @add.title
    fill_in "User", with: @add.user_id
    click_on "Create Add"

    assert_text "Add was successfully created"
    click_on "Back"
  end

  test "updating a Add" do
    visit adds_url
    click_on "Edit", match: :first

    fill_in "Body", with: @add.body
    fill_in "Img", with: @add.img
    fill_in "Title", with: @add.title
    fill_in "User", with: @add.user_id
    click_on "Update Add"

    assert_text "Add was successfully updated"
    click_on "Back"
  end

  test "destroying a Add" do
    visit adds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Add was successfully destroyed"
  end
end
