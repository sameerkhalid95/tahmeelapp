require "test_helper"

class BulkOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bulk_order = bulk_orders(:one)
  end

  test "should get index" do
    get bulk_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_bulk_order_url
    assert_response :success
  end

  test "should create bulk_order" do
    assert_difference('BulkOrder.count') do
      post bulk_orders_url, params: { bulk_order: { pick_up: @bulk_order.pick_up, reference_number: @bulk_order.reference_number, total_weight: @bulk_order.total_weight } }
    end

    assert_redirected_to bulk_order_url(BulkOrder.last)
  end

  test "should show bulk_order" do
    get bulk_order_url(@bulk_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_bulk_order_url(@bulk_order)
    assert_response :success
  end

  test "should update bulk_order" do
    patch bulk_order_url(@bulk_order), params: { bulk_order: { pick_up: @bulk_order.pick_up, reference_number: @bulk_order.reference_number, total_weight: @bulk_order.total_weight } }
    assert_redirected_to bulk_order_url(@bulk_order)
  end

  test "should destroy bulk_order" do
    assert_difference('BulkOrder.count', -1) do
      delete bulk_order_url(@bulk_order)
    end

    assert_redirected_to bulk_orders_url
  end
end
