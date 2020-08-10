require "application_system_test_case"

class FlavoursTest < ApplicationSystemTestCase
  setup do
    @flavour = flavours(:one)
  end

  test "visiting the index" do
    visit flavours_url
    assert_selector "h1", text: "Flavours"
  end

  test "creating a Flavour" do
    visit flavours_url
    click_on "New Flavour"

    fill_in "Name", with: @flavour.name
    click_on "Create Flavour"

    assert_text "Flavour was successfully created"
    click_on "Back"
  end

  test "updating a Flavour" do
    visit flavours_url
    click_on "Edit", match: :first

    fill_in "Name", with: @flavour.name
    click_on "Update Flavour"

    assert_text "Flavour was successfully updated"
    click_on "Back"
  end

  test "destroying a Flavour" do
    visit flavours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Flavour was successfully destroyed"
  end
end
