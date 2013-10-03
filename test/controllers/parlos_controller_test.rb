require 'test_helper'

class ParlosControllerTest < ActionController::TestCase
  setup do
    @parlo = parlos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parlos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parlo" do
    assert_difference('Parlo.count') do
      post :create, parlo: { country_id: @parlo.country_id, name_parlo: @parlo.name_parlo, status: @parlo.status }
    end

    assert_redirected_to parlo_path(assigns(:parlo))
  end

  test "should show parlo" do
    get :show, id: @parlo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parlo
    assert_response :success
  end

  test "should update parlo" do
    patch :update, id: @parlo, parlo: { country_id: @parlo.country_id, name_parlo: @parlo.name_parlo, status: @parlo.status }
    assert_redirected_to parlo_path(assigns(:parlo))
  end

  test "should destroy parlo" do
    assert_difference('Parlo.count', -1) do
      delete :destroy, id: @parlo
    end

    assert_redirected_to parlos_path
  end
end
