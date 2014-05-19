class UserMailer < ActionMailer::Base

  default from: "abc@xyz.com"

  def invite_user(user)
    @user = user
    mail(to: user.email, subject: "Welcome!")
  end
end
