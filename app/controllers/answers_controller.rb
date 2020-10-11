class AnswersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_question, only: [:index, :new, :create]

  layout 'teachers'

  def index
    @answers = @question.answers
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_answers_url, notice: 'Respuesta creada correctamente.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:text, :correct)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
