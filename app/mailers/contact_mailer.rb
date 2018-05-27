class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.message.subject
  #
  def new_message(contact)
    @contact = contact
    mail to: "jonathan.serafini@gmail.com", subject: "Demande d'information"
  end
end
