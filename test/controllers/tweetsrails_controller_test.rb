require 'test_helper'

class TweetsrailsControllerTest < ActionDispatch::IntegrationTest
  test "should get s" do
    get tweetsrails_s_url
    assert_response :success
  end

end
