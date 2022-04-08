class Test < ApplicationRecord
  class << self
    def tests_by_category(category)
      Test.where(category_id: (Category.where(title: category)).map { |c| c.id })
    end
  end
end
