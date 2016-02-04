class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def update
    if current_user.update(user_params)
      redirect_to :user, notice: 'User was successfully updated.'
    else
      render :show
    end
  end

  protected

  def user_params
    params.require(:user).permit(:url)
  end
end
