class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?


def after_sign_in_path_for(resource)
    flash[:success] = "sign in successfully"
    user_path(@user.id)
end

def after_sign_out_path_for(resource)
    flash[:success] = "sign out successfully"
    root_path
end

protected
def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_image])
end

end
