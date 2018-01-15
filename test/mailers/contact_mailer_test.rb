require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "contact_us" do
    contact = Contact.new(name: "person",
                          email: "person@yahoo.org",
                          message: "Hi, I am interested in your project.")
    mail = ContactMailer.contact_us(contact)

    assert_emails 1 do
        mail.deliver_now
    end

    assert_equal "Tweechable Contact", mail.subject
    assert_equal ["tweechable@gmail.com"], mail.to
    assert_equal ["person@yahoo.org"], mail.from
    assert_match /Hi, I am interested in your project./, mail.message.encoded
  end

end
