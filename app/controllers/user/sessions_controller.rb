class User::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: :destroy
  respond_to :js

  def create
    self.resource = warden.authenticate(auth_options)
    if resource && resource.active_for_authentication?
      flash.now[:success] = 'Signed in successfully.'
      sign_in(resource_name, resource)      
    else
      flash.now[:danger] = 'Invalid Email or Password'
    end
  end

end
