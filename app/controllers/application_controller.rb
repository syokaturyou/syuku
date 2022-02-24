class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      'sub-layout'
    else
      'application'
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
