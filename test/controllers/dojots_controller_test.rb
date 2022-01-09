require "test_helper"

class DojotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dojot = dojots(:one)
  end

  test "should get index" do
    get dojots_url
    assert_response :success
  end

  test "should get new" do
    get new_dojot_url
    assert_response :success
  end

  test "should create dojot" do
    assert_difference("Dojot.count") do
      post dojots_url, params: { dojot: { email: @dojot.email, first_name: @dojot.first_name, last_name: @dojot.last_name, phone: @dojot.phone, twitter: @dojot.twitter } }
    end

    assert_redirected_to dojot_url(Dojot.last)
  end

  test "should show dojot" do
    get dojot_url(@dojot)
    assert_response :success
  end

  test "should get edit" do
    get edit_dojot_url(@dojot)
    assert_response :success
  end

  test "should update dojot" do
    patch dojot_url(@dojot), params: { dojot: { email: @dojot.email, first_name: @dojot.first_name, last_name: @dojot.last_name, phone: @dojot.phone, twitter: @dojot.twitter } }
    assert_redirected_to dojot_url(@dojot)
  end

  test "should destroy dojot" do
    assert_difference("Dojot.count", -1) do
      delete dojot_url(@dojot)
    end

    assert_redirected_to dojots_url
  end
end
