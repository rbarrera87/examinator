class AnswersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_question, only: [:index]

  layout 'teachers'

  def index
    @answers = @question.answers
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end
end
