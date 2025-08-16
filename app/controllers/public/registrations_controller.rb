class Public::RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, only: [:create, :update]

  def new
    super
  end

  def create
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :body, :profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :body, :profile_image])
  end

  def after_sign_up_path_for(resource)
    about_path
  end
end
