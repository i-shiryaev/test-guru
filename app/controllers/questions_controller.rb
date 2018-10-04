class QuestionsController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :find_test, only: %i[index show new]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    question = Question.create(test_id: params[:test_id], body: params[:body])
    question.save
    redirect_to action: 'index', id: params[:test_id]
  end

  def new
    @test_id = @test.id
  end

  def destroy
    question = Questions.find(params[:id])
    question.destroy
    redirect_to action: 'index', id: params[:test_id]
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render html: "<p>Question doesn't exist</p>".safe_html
  end
end
