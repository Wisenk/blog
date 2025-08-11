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
    (controller_name == 'homes' && %w[top about].include?(action_name)) ||
    (controller_name == 'post_blogs' && action_name == 'search') ||
    (controller_name == 'post_blogs' && action_name == 'index') ||
    (controller_name == 'post_blogs' && action_name == 'show')
  end


end


