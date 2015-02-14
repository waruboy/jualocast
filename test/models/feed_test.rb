require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @feed = Feed.new(name: "Cool Cast", user: @user, description: "What a cool cast!")
  end

  test "should be valid" do
    assert @feed.valid?
  end

  test "name should be present" do
    @feed.name = "  "
    assert_not @feed.valid?
  end
  test "description may be missing" do
    @feed.description = "  "
    assert @feed.valid?
  end
end
