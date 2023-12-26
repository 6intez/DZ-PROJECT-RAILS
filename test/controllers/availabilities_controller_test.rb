require "test_helper"

class AvailabilitiesControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
      master_a = Master.create(name: "Test_master")
      av1 = Availability.create(master_id: master_a.id, date: "2022-01-01", availible: 1)
      get availabilities_index_url(name: "Test_master"), as: :json
      assert_response :success
      data = JSON.parse(response.body)
      assert_not_nil data
      assert_equal ["2022-01-01"], data
    end

end
