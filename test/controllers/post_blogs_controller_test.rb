require "test_helper"

class PostBlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get post_blogs_new_url
    assert_response :success
  end

  test "should get edit" do
    get post_blogs_edit_url
    assert_response :success
  end

  test "should get show" do
    get post_blogs_show_url
    assert_response :success
  end

  test "should get view" do
    get post_blogs_view_url
    assert_response :success
  end
end
