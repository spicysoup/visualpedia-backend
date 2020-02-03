class QuizController < ApplicationController
  before_action :authenticate_request

  attr_reader :current_user

  def new
    count = params[:count].to_i
    @questions = Question.offset(rand(500)).limit(count)
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result

    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end

