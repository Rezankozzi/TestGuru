# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true, length: { minimum: 10 }
  validates_uniqueness_of :body, message: 'The question already exists!'
end
