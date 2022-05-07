class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  class << self
    def tests_by_category(category)
      Test.order('tests.title asc')
          .joins('JOIN categories ON tests.category_id = categories.id')
          .where(categories: {title: category})
          .pluck(:title)
    end
  end
end
