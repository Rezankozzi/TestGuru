# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index show]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :object_not_found

  def index
    render plain: @test.questions.pluck(:body)
  end

  def show
    render plain: @question.body
  end

  def new; end

  def create
    @question = Question.new(question_params)
    if @question.save!
      redirect_to test_questions_path
    else
      render plain: 'Question was not created! Check your data!'
    end
  end

  def destroy
    @question.destroy
  end

  private

  def find_test
    @current_search = 'Test'
    @test = Test.find(params[:test_id])
  end

  def find_question
    @current_search = 'Question'
    @question = Question.find(params[:id])
  end

  def object_not_found
    render plain: "#{@current_search} not found!"
  end

  def question_params
    params.permit(:body, :test_id)
  end
end
