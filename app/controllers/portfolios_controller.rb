class PortfoliosController < ApplicationController
	
	def index
		@selected_tab = { protfolio: :active }
	end
	
end
