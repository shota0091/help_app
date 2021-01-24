class HomesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to posts_path
    end
  end

    def new
      @home = Home.new
    end

    def create
      @home = Home.new(home_params)
      if @home.save
        HomeMailer.home_mail(@home).deliver
        redirect_to root_path
      else
        render :new
      end
    end

    def inquiry
    end

    def PrivacyPolicy
    end

    private

    def home_params
      params.require(:home).permit(:name, :text)
    end
  
end
