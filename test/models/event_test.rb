require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "#created_by? owner_idと引数の#idが同じ時" do
    event = FactoryBot.create(:event)
    user = Minitest::Mock.new.expect(:id, event.owner_id)
    assert_equal(true, event.created_by?(user))
    user.verify
  end
  test "#created_by? owner_idと引数の#idが異なる時" do
    event = FactoryBot.create(:event)
    user = Minitest::Mock.new.expect(:id, event.owner_id)
    another_user = FactoryBot.create(:user)
    assert_equal(false, event.created_by?(another_user))
    user.verify # メソッドが呼び出されていない場合はMockExpectationErrorがでる
  end
  test "#created_by? 引数がnilな時" do
    event = FactoryBot.create(:event)
    assert_equal(false, event.created_by?(nil))
  end
end
