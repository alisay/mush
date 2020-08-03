require "application_system_test_case"

class MushroomsTest < ApplicationSystemTestCase
  setup do
    @mushroom = mushrooms(:one)
  end

  test "visiting the index" do
    visit mushrooms_url
    assert_selector "h1", text: "Mushrooms"
  end

  test "creating a Mushroom" do
    visit mushrooms_url
    click_on "New Mushroom"

    fill_in "Seller", with: @mushroom.seller_id
    fill_in "Type", with: @mushroom.type
    click_on "Create Mushroom"

    assert_text "Mushroom was successfully created"
    click_on "Back"
  end

  test "updating a Mushroom" do
    visit mushrooms_url
    click_on "Edit", match: :first

    fill_in "Seller", with: @mushroom.seller_id
    fill_in "Type", with: @mushroom.type
    click_on "Update Mushroom"

    assert_text "Mushroom was successfully updated"
    click_on "Back"
  end

  test "destroying a Mushroom" do
    visit mushrooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mushroom was successfully destroyed"
  end
end
