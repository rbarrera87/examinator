class QuestionsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_quiz, only: [:index, :new, :create]
  before_action :set_question, only: [:edit, :update, :destroy]

  layout 'teachers'

  def index
    @questions = @quiz.questions
  end

  def new
    @question = @quiz.questions.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to quiz_questions_url(@question.quiz), notice: 'Pregunta editada correctamente.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to quiz_questions_url(@question.quiz), notice: 'La pregunta fue borrada.' }
      format.json { head :no_content }
    end
  end

  def create
    @question = @quiz.questions.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to quiz_questions_url, notice: 'Pregunta creada correctamente.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end

  def set_quiz
    @quiz = current_user.quizzes.find(params[:quiz_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
