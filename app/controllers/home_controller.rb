class HomeController < ApplicationController
	
	def index
		@selected_tab = { home: :active }
	end

	def about
		@selected_tab = { about: :active }
	end

end
