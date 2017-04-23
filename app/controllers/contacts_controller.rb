class ContactsController < ApplicationController
  layout false, only: [:new, :create]
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Your message has been delivered. We will respond to you soon!'
    else
      flash[:alert] = 'Your message was not sent. Please try again.'
    end
    redirect_to root_path
  end
end