class EvaluatesController < ApplicationController


  def create
    @evaluate = Evaluate.create(evaluates_params)
    if @evaluate.save
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def evaluates_params
    params.permit(:speedy, :kindness, :frantically).merge(user_id: current_user.id)
  end
end
