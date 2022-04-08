class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(id: UserTest.where(user_id: self.id).map { |c| c.test_id }, level: level)
  end
end
