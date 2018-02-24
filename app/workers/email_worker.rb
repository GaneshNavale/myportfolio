class EmailWorker
  include Sidekiq::Worker
  # sidekiq_options retry: false

  def perform(contact_id)
  	@contact = Contact.find(contact_id)
		# uri = URI.parse("https://pygments.simplabs.com/")
		# request = Net::HTTP.post_form(uri, lang: 'ruby', code: plain_code)
		# snippet.update_attribute(:highlighted_code, request.body)
		Mailer.send_email(email_body).deliver_now

  end

	def email_body
		"Hi \nMessage from #{@contact.name} \n message is :\n #{@contact.message}"
	end
end

