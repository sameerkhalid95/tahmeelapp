require "application_system_test_case"

class BulkOrdersTest < ApplicationSystemTestCase
  setup do
    @bulk_order = bulk_orders(:one)
  end

  test "visiting the index" do
    visit bulk_orders_url
    assert_selector "h1", text: "Bulk Orders"
  end

  test "creating a Bulk order" do
    visit bulk_orders_url
    click_on "New Bulk Order"

    fill_in "Pick up", with: @bulk_order.pick_up
    fill_in "Reference number", with: @bulk_order.reference_number
    fill_in "Total weight", with: @bulk_order.total_weight
    click_on "Create Bulk order"

    assert_text "Bulk order was successfully created"
    click_on "Back"
  end

  test "updating a Bulk order" do
    visit bulk_orders_url
    click_on "Edit", match: :first

    fill_in "Pick up", with: @bulk_order.pick_up
    fill_in "Reference number", with: @bulk_order.reference_number
    fill_in "Total weight", with: @bulk_order.total_weight
    click_on "Update Bulk order"

    assert_text "Bulk order was successfully updated"
    click_on "Back"
  end

  test "destroying a Bulk order" do
    visit bulk_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bulk order was successfully destroyed"
  end
end
