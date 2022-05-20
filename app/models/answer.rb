# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_number_of_answers, on: :create

  private

  def validate_number_of_answers
    message = 'Number of answers should be between 1..4'
    errors.add :base, :invalid, message: message if question.answers.count > 4
  end
end