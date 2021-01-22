# Preview all emails at http://localhost:3000/rails/mailers/home
class HomePreview < ActionMailer::Preview
  def home_mail
    @home = Home.new(name: "斎藤",text: "問合せ")

    HomeMailer.home_mail(home)
  end
end
