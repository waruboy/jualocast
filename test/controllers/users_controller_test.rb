require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user       = users(:michael)
    @other_user = users(:barrack)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  

end
