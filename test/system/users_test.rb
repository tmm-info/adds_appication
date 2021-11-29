require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Address", with: @user.address
    fill_in "Birthday", with: @user.birthday
    fill_in "City", with: @user.city
    fill_in "Country", with: @user.country
    fill_in "Email", with: @user.email
    fill_in "Full name", with: @user.full_name
    fill_in "Login", with: @user.login
    fill_in "Role", with: @user.role_id
    fill_in "State", with: @user.state
    fill_in "Username", with: @user.username
    fill_in "Zip", with: @user.zip
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Address", with: @user.address
    fill_in "Birthday", with: @user.birthday
    fill_in "City", with: @user.city
    fill_in "Country", with: @user.country
    fill_in "Email", with: @user.email
    fill_in "Full name", with: @user.full_name
    fill_in "Login", with: @user.login
    fill_in "Role", with: @user.role_id
    fill_in "State", with: @user.state
    fill_in "Username", with: @user.username
    fill_in "Zip", with: @user.zip
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
