class HomesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to posts_path
    end
  end

    def new
    end

    def inquiry
    end

    def PrivacyPolicy
    end
  
end
