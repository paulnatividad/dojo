require "application_system_test_case"

class DojotsTest < ApplicationSystemTestCase
  setup do
    @dojot = dojots(:one)
  end

  test "visiting the index" do
    visit dojots_url
    assert_selector "h1", text: "Dojots"
  end

  test "should create dojot" do
    visit dojots_url
    click_on "New dojot"

    fill_in "Email", with: @dojot.email
    fill_in "First name", with: @dojot.first_name
    fill_in "Last name", with: @dojot.last_name
    fill_in "Phone", with: @dojot.phone
    fill_in "Twitter", with: @dojot.twitter
    click_on "Create Dojot"

    assert_text "Dojot was successfully created"
    click_on "Back"
  end

  test "should update Dojot" do
    visit dojot_url(@dojot)
    click_on "Edit this dojot", match: :first

    fill_in "Email", with: @dojot.email
    fill_in "First name", with: @dojot.first_name
    fill_in "Last name", with: @dojot.last_name
    fill_in "Phone", with: @dojot.phone
    fill_in "Twitter", with: @dojot.twitter
    click_on "Update Dojot"

    assert_text "Dojot was successfully updated"
    click_on "Back"
  end

  test "should destroy Dojot" do
    visit dojot_url(@dojot)
    click_on "Destroy this dojot", match: :first

    assert_text "Dojot was successfully destroyed"
  end
end
