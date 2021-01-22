class HomeMailer < ApplicationMailer

  def home_mail(home)
    @home = home
    mail to:'to@example.com',subject: 'お問い合わせメール'
  
  end
end
