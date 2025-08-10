class ApplicationController < ActionController::Base
  before_action :configure_authentication

  private

  def configure_authentication
    if admin_controller?
      authenticate_admin!
    else
      authenticate_user! unless action_is_public? 
    end
  end

  def admin_controller?
    self.class.module_parent == Admin
  end

  def action_is_public?
    controller_name == 'home' && action_name == 'top'
  end

end



