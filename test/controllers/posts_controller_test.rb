require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get feed" do
    get posts_feed_url
    assert_response :success
  end

end
