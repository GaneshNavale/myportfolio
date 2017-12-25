class User::PasswordsController < Devise::PasswordsController
  respond_to :js

  def edit
    @selected_tab = {}
    super
  end

end
