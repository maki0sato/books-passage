class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_user
  end
  

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :favalid_author, :genre_id, :text)
  end
end