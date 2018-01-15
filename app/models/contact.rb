class Contact < ActiveRecord::Base

  validates :name, presence: true
  validates :message, presence: true
  validates_format_of :email, :with => /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/


  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Tweechable Contact",
      :to => "tweechable@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end