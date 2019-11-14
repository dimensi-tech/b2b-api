require 'test_helper'

class V1::TokensControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get v1_tokens_create_url
    assert_response :success
  end

end
