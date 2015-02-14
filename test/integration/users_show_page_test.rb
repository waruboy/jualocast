require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:barrack)
  end

   test "should not show add feed button when not logged in" do
    get user_path @user
    assert_select "input", false
  end

  test "should not show add feed button when logged in as wrong user" do
    log_in_as @other_user

    get user_path @user
    assert is_logged_in?
    assert_select "input", false
  end

  test "should show add feed button when logged in as correct user" do
    log_in_as @user

    get user_path @user
    assert is_logged_in?
    assert_select "input"
  end
end