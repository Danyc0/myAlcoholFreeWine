require 'test_helper'

class ShoppingCartsControllerTest < ActionController::TestCase
  test "add to basket" do
    create id => 0, num_wine => 1
    assert_not_null @shopping_cart
  end

  test "clear basket" do
    create id => 0, num_wine => 1
    clear
    if @shopping_cart.total_unique_items == 0
        assert_true
    else
        assert_false
    end
  end

  test "check checkout clears basket" do
    create id => 0, num_wine => 1
    checkout
    if @shopping_cart.total_unique_items == 0
        assert_true
    else
        assert_false
    end
  end
end
