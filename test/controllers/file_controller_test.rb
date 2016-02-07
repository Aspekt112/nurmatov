require 'test_helper'

class FileControllerTest < ActionController::TestCase
  test "should get files" do
    get :files
    assert_response :success
  end

end
