class Contact < ActiveRecord::Base
	validates :name, :message, :email, presence: true
end
