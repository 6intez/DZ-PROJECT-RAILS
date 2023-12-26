require "test_helper"

class ListingApTest < ActiveSupport::TestCase
  test "should not save record" do
   ListingAp.create(email: 'unique').save
    assert_not ListingAp.create(email: 'unique').save
  end
end
