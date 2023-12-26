require "test_helper"

class AppointmentControllerTest < ActionDispatch::IntegrationTest

  test "should get view" do
    master = Master.create(name: "Test_master")
    availability = Availability.create(master_id: master.id, date: "2022-01-01", availible: 1)

    get appointment1_view_path, params: { name: "John Doe", phoneNumber: "test@gmail.com", date: "2022-01-01", master_name: "Test_master" }, as: :json
    assert_response :success

    result = JSON.parse(response.body)
    assert_equal "Success", result["response"]

  end
  test "should not get view without email" do
    master = Master.create(name: "Test_master")
    availability = Availability.create(master_id: master.id, date: "2022-01-01", availible: 1)

    get appointment1_view_path, params: { name: "John Doe", phoneNumber: "", date: "2022-01-01", master_name: "Test_master" }, as: :json
    assert_response :success

    result = JSON.parse(response.body)
    assert_equal "error", result["response"]

  end
  test "should not get view without name" do
    master = Master.create(name: "Test_master")
    availability = Availability.create(master_id: master.id, date: "2022-01-01", availible: 1)

    get appointment1_view_path, params: { name: "", phoneNumber: "chep@gmail.com", date: "2022-01-01", master_name: "Test_master" }, as: :json
    assert_response :success

    result = JSON.parse(response.body)
    assert_equal "error", result["response"]

  end

  test "should update availability and delete appointment" do
    master = Master.create(name: "John")
    availability = Availability.create(date: Date.today, master_id: master.id, availible: 0)
    list_ap = ListingAp.create(email: "test@example.com", date: Date.today, master_name: "John")

    post "/availabilities/destroy", params: { email: "test@example.com", date: Date.today }

    assert_response :success
    response_body = JSON.parse(response.body)
    assert_equal "Success", response_body["response"]



    assert_nil ListingAp.find_by(email: "test@example.com", date: Date.today) # Запись списка аппоинтментов должна быть удалена
  end

  test "should handle case where listing appointment doesn't exist" do
    post "/availabilities/destroy", params: { email: "nonexistent@example.com", date: Date.today }

    assert_response :success
    response_body = JSON.parse(response.body)
    assert_equal "http://127.0.0.1:3000/my_account/view", response_body["redirect"]
  end


end
