class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,
                                                       :photo_id,
                                                       :first_name,
                                                       :last_name,
                                                       :racoon,
                                                       :balance,
                                                       :address,
                                                       :city,
                                                       :created_at,
                                                       :updated_at,
                                                       :email,
                                                       :encrypted_password,
                                                       :reset_password_token,
                                                       :reset_password_sent_at,
                                                       :remember_created_at])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username,
                                                              :photo_id,
                                                              :racoon,
                                                              :address,
                                                              :city,
                                                              :email])
  end
end
