# Preview all emails at http://localhost:3000/rails/mailers/message
class MessagePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message/contact_us
  def contact_us
    Message.contact_us
  end

end
