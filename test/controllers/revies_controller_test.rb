require "test_helper"

class ReviesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get revies_create_url
    assert_response :success
  end
end
