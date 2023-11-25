require "test_helper"

class PersonalInformationControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get personal_information_show_url
    assert_response :success
  end
end
