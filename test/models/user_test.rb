require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save record" do
    User.create(email: 'unique').save
    assert_not User.create(email: 'unique').save
  end
end
