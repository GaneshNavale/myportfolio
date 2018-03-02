class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def redirect_if_access_denied
		redirect_to root_path unless current_user.present? && current_user.have_permission?
	end

end
