class HomeController < ApplicationController
	def index
		@selected_tab = { home: :active }
	end
end
