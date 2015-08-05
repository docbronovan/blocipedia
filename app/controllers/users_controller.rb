class UsersController < ApplicationController
 
  def update
    @user = current_user
    wikis = Wiki.visible_to(current_user)
    @wikis = policy_scope(Wiki)

    if current_user.update_attributes(user_params)
      @wikis.update_all(private: false) if current_user.standard?
      flash[:notice] = "User information updated"
      redirect_to current_user
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path(current_user)
    end
  end
 

  def show
    @user = current_user
  end

  private
 
  def user_params
    params.require(:user).permit(:name, :role)
  end
end