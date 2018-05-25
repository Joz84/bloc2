class UserMailer < ApplicationMailer
  def inscription(user)
    @user = user
    mail to: @user.email, subject: "Bienvenue sur notre service"
  end
end
