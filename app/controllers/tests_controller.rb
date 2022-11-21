# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :all_tests, only: %i[show index]
  before_action :find_test, only: %i[show]

  def index; end

  def show; end

  private

  def all_tests
    @tests = Test.all
  end

  def find_test
    @test = @tests.find(test_params[:id])
  end

  def test_params
    params.permit(:title, :id, :level)
  end
end
