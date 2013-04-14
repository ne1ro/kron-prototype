require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get welcome" do
    get :welcome
    assert_response :success
  end

  test "should get tour" do
    get :tour
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
