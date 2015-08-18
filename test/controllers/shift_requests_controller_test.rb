require 'test_helper'

class ShiftRequestsControllerTest < ActionController::TestCase
  setup do
    @shift_request = shift_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shift_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shift_request" do
    assert_difference('ShiftRequest.count') do
      post :create, shift_request: {  }
    end

    assert_redirected_to shift_request_path(assigns(:shift_request))
  end

  test "should show shift_request" do
    get :show, id: @shift_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shift_request
    assert_response :success
  end

  test "should update shift_request" do
    patch :update, id: @shift_request, shift_request: {  }
    assert_redirected_to shift_request_path(assigns(:shift_request))
  end

  test "should destroy shift_request" do
    assert_difference('ShiftRequest.count', -1) do
      delete :destroy, id: @shift_request
    end

    assert_redirected_to shift_requests_path
  end
end
