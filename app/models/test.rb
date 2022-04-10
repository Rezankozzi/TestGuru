class Test < ApplicationRecord
  class << self
    def tests_by_category(category)
      Test.order(created_at::desc)
          .where(category_id: (Category.where(title: category)).pluck(:id))
          .pluck(:title)
    end
  end
end
