require 'test_helper'

class UsersAnnouncementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_announcements_index_url
    assert_response :success
  end

end
