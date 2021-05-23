require 'test_helper'

class PublicAnnouncementControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_announcement_index_url
    assert_response :success
  end

  test "should get show" do
    get public_announcement_show_url
    assert_response :success
  end

end
