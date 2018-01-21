require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase

  def setup
    @contact = contacts(:test_first_contact)
  end

  test "contact_us" do
    mail = ContactMailer.contact_us(@contact)

    assert_emails 1 do
        mail.deliver_now
    end

    assert_equal "Tweechable Contact", mail.subject
    assert_equal ["tweechable@gmail.com"], mail.to
    assert_equal ["friendly@emailhost.com"], mail.from
    assert_match /Inquiry about project/, mail.message.encoded
  end

end
