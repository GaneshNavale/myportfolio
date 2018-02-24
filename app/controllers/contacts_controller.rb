class ContactsController < ApplicationController

	def index
		@selected_tab = { contact: :active }
	end

	def new
		@contact = Contact.new
		@selected_tab = { contact: :active }
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			EmailWorker.perform_async(@contact.id)
			flash.now[:success] = 'Message was delivered succesfully.'
		else
			show_validation_errors(@contact)
		end
	end

	def show
	end

	def contact_params
		params.require(:contact).permit(:name, :email, :message)
	end


end
