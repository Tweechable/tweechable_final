class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_us.subject
  #
  def contact_us(contact)
    @message = contact.message

    mail to: "tweechable@gmail.com", from: contact.email
  end
end
