class QuizzesController < ApplicationController
  before_action :authenticate_user!

  def index
    @quizzes = current_user.quizzes
  end
end
