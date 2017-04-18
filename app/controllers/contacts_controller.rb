class ContactsController < ApplicationController
  
  # Get request to /contact-us
  # Show new contact form
  def new
    @contact = Contact.new #großes C bei contact weil es danach im modell file sucht contact.rb
  end
  
  # Post request /contacts
  def create
    # Mass assignement of form fields into contact objects
    @contact = Contact.new(contact_params)
    # save the contact object to the database
    if @contact.save
      # Store form fields via parameter, into variables
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      # plug variables into catact Mailer email method and send email
      ContactMailer.contact_email(name, email, body).deliver
      # Store succes message in flash hash
      # and redirect to the new action
      flash[:success] = "Message sent."
      redirect_to new_contact_path
    else
      # if contact object doesn't save, 
      # store errors in flash hash,
      # and redirect to the new action
      flash[:danger] = @contact.errors.full_messages.join(", ") 
      redirect_to new_contact_path
    end
  end
  
  private
    # To collect data, from form, we need to use strong parameters
    # and whitelist the form fields //secruty feature
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end 