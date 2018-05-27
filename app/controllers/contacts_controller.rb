class ContactsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.new_message(@contact).deliver_now
      flash.now[:notice] = 'Merci pour votre message'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(
      :first_name,
      :last_name,
      :phone,
      :email,
      :message)
  end
end
