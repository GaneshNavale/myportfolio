class ContactsController < ApplicationController

	def index
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			Mailer.send_email(message_body).deliver_now
			flash.now[:success] = 'Message was delivered succesfully.'
		else
			show_validation_errors(@contact) 
		end
	end

	def show
	end

	private

	def contact_params
		params.require(:contact).permit(:name, :email, :message)
	end

	def message_body
		"Hi \nMessage from #{@contact.name} \n message is :\n #{@contact.message}"
	end

end
