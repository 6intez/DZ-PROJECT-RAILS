require "test_helper"

class MasterTest < ActiveSupport::TestCase
  test "should not save record" do
    Master.create(name: 'unique').save
    assert_not Master.create(name: 'unique').save
  end
end
