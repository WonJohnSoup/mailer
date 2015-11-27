class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def show
    render :show
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message. I will contact you soon!'
    else
      flash.now[:error] = 'Could not send message. Please contact me directly at wonjohnsoup@gmail.com. Thank you!'
      render :new
    end
  end
end