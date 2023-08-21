class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  private
  def configure_permitted_parameters
    #sign_up（新規登録の処理）に対して、nicknameというキーのパラメーターを新たに許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
          #deviseでencrypted_passwordに登録する時ストロングパラメーターはこっちで書く→:password, :password_confirmation,
          #devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :name, :profile, :occupation, :position])

  end
end
