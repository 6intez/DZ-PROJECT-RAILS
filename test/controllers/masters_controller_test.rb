require "test_helper"

class MastersControllerTest < ActionDispatch::IntegrationTest
  test "should get available times" do
    get masters_available_times_url, as: :json
    assert_response :success

    data = JSON.parse(response.body)
    assert_not_nil data
    assert_equal Master.all.map{ |a| a.name }, data
  end
end
