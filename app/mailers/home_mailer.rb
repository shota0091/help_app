class HomeMailer < ApplicationMailer

  def send_mail(home)
    @home = home
    mail to 'syou0235@gmail.com', subject: 'お問い合わせ内容'
end
