require 'test_helper'

class SenditControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get doit" do
    get :doit
    assert_response :success
  end

end
