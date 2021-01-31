class HomeMailer < ApplicationMailer

  def home_mail(home)
    @home = home
    mail to: 'web-site@example.com',subject: 'お問い合わせメール'
  end
end
