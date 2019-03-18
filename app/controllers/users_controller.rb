class UsersController < ApplicationController
  before_action :header_menu,only: [:index,:edit,:index]

  def index
  end

  def edit
    @user = current_user
  end

  def update
    if User.update(update_params)
      redirect_to users_path
    else
      renderb:edit
    end
  end

  private
  def update_params
    params.require(:user).permit(:nickname, :profile, :icon)
  end
end
