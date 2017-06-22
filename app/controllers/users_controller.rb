class UsersController < ApplicationController
  def index
    if current_user.admin?
      @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
    else
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
