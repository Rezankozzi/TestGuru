# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[new index create]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :object_not_found

  def index
    redirect_to test_questions_path
  end

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @test
    else
      render inline: '<strong>The question is not was created!</strong>'
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question.test
    else
      render :edit
    end
  end

  def edit; end

  def destroy
    @question.destroy
    render plain: 'Question was deleted!'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def object_not_found
    render plain: 'Object not found!'
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
