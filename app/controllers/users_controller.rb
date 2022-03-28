class UsersController < ApplicationController
  def create(user_params)
  end

  def new
  end

  def create(_user_params)
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth)
  end
end
