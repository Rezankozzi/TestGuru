# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :tests

  default_scope { order(title: :asc) }

  validates :title, presence: { message: "title category can't be blank" }
  validates :title, uniqueness: { message: 'category with this title already exists' }
end