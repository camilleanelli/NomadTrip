class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_users_path
    else
      dashboard_path
    end
  end


  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nomadlist_username, :filepicker_url])
  end

end
