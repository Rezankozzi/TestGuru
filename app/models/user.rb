class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(id: UserTest.where(user_id: self.id).pluck(:id), level: level)
  end
end
