class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @test.questions.create(question_params)
    redirect_to action: 'index', id: @test.id
  end

  def new
  end

  def destroy
    @question.destroy
    redirect_to action: 'index', id: params[:test_id]
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render html: "<p>Question doesn't exist.</p>".html_safe
  end
end
