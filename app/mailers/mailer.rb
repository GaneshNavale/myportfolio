class Mailer < ApplicationMailer
	
	def send_email(body)
		mail(to: 'navale.developer@gmail.com', body: body, content_type: 'text/html', subject: 'Message from your website')
	end

end
