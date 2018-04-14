class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash.now[:error] = nil
      ContactMailer.contact_us(@contact).deliver_now
      flash.now[:notice] = 'Message valid.'
    else
      flash.now[:alert] = 'Cannot send message.'
      render :new
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end

end
