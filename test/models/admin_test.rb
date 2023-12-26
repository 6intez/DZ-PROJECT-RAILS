require "test_helper"

class AdminTest < ActiveSupport::TestCase
  test "should not save record" do
    Admin.create(email: 'unique').save
    assert_not Admin.create(email: 'unique').save
  end

end
