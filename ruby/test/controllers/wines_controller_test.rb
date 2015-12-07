require 'test_helper'

class WinesControllerTest < ActionController::TestCase
  test "find wines" do
     find :wine
     assert_response :success
     assert_not_nil assigns(:wines)
  end

  test "show all wines" do
    index
    assert_response :success
    assert_not_nil assigns(:wines)
  end

  test "finds wine called wine" do
     find :awine
     assert_response :success
     if @response.length > 0
        assert_true
     else
        assert_false
     end
  end
end
