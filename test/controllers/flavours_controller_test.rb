require 'test_helper'

class FlavoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flavour = flavours(:one)
  end

  test "should get index" do
    get flavours_url
    assert_response :success
  end

  test "should get new" do
    get new_flavour_url
    assert_response :success
  end

  test "should create flavour" do
    assert_difference('Flavour.count') do
      post flavours_url, params: { flavour: { name: @flavour.name } }
    end

    assert_redirected_to flavour_url(Flavour.last)
  end

  test "should show flavour" do
    get flavour_url(@flavour)
    assert_response :success
  end

  test "should get edit" do
    get edit_flavour_url(@flavour)
    assert_response :success
  end

  test "should update flavour" do
    patch flavour_url(@flavour), params: { flavour: { name: @flavour.name } }
    assert_redirected_to flavour_url(@flavour)
  end

  test "should destroy flavour" do
    assert_difference('Flavour.count', -1) do
      delete flavour_url(@flavour)
    end

    assert_redirected_to flavours_url
  end
end
