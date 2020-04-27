class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show edit update destroy]
  before_action :find_test, only: %i[index new create update]

  rescue_from ActiveRecord::RecordNotFound,
              with: :rescue_with_question_not_found

  def index; end

  def show; end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
    @test = @question.test
  end

  def update
    @test = @question.test
    if @question.update(question_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    message = "The question with id - #{params[:id]} wasn\'t found"
    render plain: message, status: :not_found
  end
end
