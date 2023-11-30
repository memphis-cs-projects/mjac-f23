require "test_helper"

class ReturnsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get returns_new_url
    assert_response :success
  end

  test "should get create" do
    get returns_create_url
    assert_response :success
  end
end
