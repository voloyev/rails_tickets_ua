# add name field ato resistration and user at all
class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name, :email,
                                 :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :current_password)
  end
end
