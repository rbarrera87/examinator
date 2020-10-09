class QuizzesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_quiz, only: [:destroy, :show, :edit, :update]
  before_action :set_questions, only: [:show]

  layout 'teachers'

  def index
    @quizzes = current_user.quizzes
  end

  def new
    @quiz = current_user.quizzes.new
  end

  def create
    @quiz = current_user.quizzes.new(quiz_params)
    respond_to do |format|
      if @quiz.save
        format.html { redirect_to quizzes_url, notice: 'El Examen fue creado correctamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to quizzes_url, notice: "Examen editado correctamente" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Examen fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private

  def set_quiz
    @quiz = current_user.quizzes.find(params[:id])
  end

  def set_questions
    @questions = @quiz.questions
  end

  def quiz_params
    params.require(:quiz).permit(:title)
  end
end
