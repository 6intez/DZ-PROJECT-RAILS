require "test_helper"

class AvailabilityTest < ActiveSupport::TestCase
  test "should not save record" do
    assert_not Availability.create(master_id: '10', date: '2021-11-11', availible: 1).save
    assert_not Availability.create(master_id: '10', date: '2022-11-11', availible: 1).save
  end

end
