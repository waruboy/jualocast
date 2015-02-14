require 'test_helper'

class FeedsControllerTest < ActionController::TestCase
  setup do
    @user = users(:michael)
    @wrong_user = users(:barrack)
  #   @feed = feeds(:one)
  end

  test "should redirect new to login when not logged in" do
    get :new, username: @user.username
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect new to root when logged in as wrong user" do
    log_in_as @wrong_user
    get :new, username: @user.username
    assert is_logged_in?
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should get new when logged in as correct user" do
    log_in_as @user
    get :new, username: @user.username
    assert_response :success
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:feeds)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create feed" do
  #   assert_difference('Feed.count') do
  #     post :create, feed: { name: @feed.name, slug: @feed.slug }
  #   end

  #   assert_redirected_to feed_path(assigns(:feed))
  # end

  # test "should show feed" do
  #   get :show, id: @feed
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @feed
  #   assert_response :success
  # end

  # test "should update feed" do
  #   patch :update, id: @feed, feed: { name: @feed.name, slug: @feed.slug }
  #   assert_redirected_to feed_path(assigns(:feed))
  # end

  # test "should destroy feed" do
  #   assert_difference('Feed.count', -1) do
  #     delete :destroy, id: @feed
  #   end

  #   assert_redirected_to feeds_path
  # end
end
