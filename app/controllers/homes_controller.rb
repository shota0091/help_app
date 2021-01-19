class HomesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to posts_path
    end
  end

    def terms
      @home = Home.new
    end

    def create
      @home = Home.new(terms_params)
      if @home.save
        ContactMailer.contact_mail(@contact).deliver
        redirect_to terms_apth
      else
        render terms_apth
      end
    end

    def inquiry
    end

    def PrivacyPolicy
    end

    private

    def terms_params
      params.require(:terms).permit(:name, :text)
    end
  
end
