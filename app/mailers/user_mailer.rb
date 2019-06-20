class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contact.subject
  #
  def contact(artist,user)
    @artist = artist
    @user = user

    @greeting = "Hi"

    if @artist.business_email.nil?
      @mail = 'belarba@gmail.com'
    else
      @mail = @artist.business_email
    end

    mail(
      to: @mail,
      subject: "New contact from Tattu.app"
    )
  end
end
