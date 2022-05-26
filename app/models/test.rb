# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  belongs_to :author, class_name: 'User'
  has_many :user_tests
  has_many :users, through: :user_tests

  scope :tests_by_category, ->(category) { joins(:category).where(categories: { title: category }) }
  scope :tests_entry_level, -> { where(level: 0..1) }
  scope :tests_middle_level, -> { where(level: 2..4) }
  scope :tests_advanced_level, -> { where(level: 5..FLOAT::INFINITY) }

  validates :level, numericality: { only_integer: true }
  validates :title, presence: true, uniqueness: { scope: :level,
                                                  message: 'test with this name and level already exists' }

  def self.tests_title_by_category(category)
    tests_by_category(category).order(title: :asc).pluck(:title)
  end
end
