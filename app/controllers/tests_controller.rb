class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy start]
  before_action :set_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.creator_id = 4

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def set_user
    # simlified
    @user = User.first
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :creator_id)
  end
end
