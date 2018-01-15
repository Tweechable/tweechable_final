# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/contact_us
  def contact_us
    contact = Contact.new(name: "person", email: "human@space.com", message: "Hi, I have a thought.")

    ContactMailer.contact_us(contact)
  end

end
