class EvaluatesController < ApplicationController
  def new
    @evaluate = Evaluate.new
  end
  
  def create
    @evaluate = Evaluate.new(evaluates_params)
    if @evaluate.save
      redirect_to "/"
    else
      render :show
    end
  end

  private
  def evaluates_params
    params.require(:evaluate).permit(:speedy, :kindness, :frantically).merge(user_id: current_user.id)
  end
end
