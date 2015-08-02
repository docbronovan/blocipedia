class UsersController < ApplicationController
 
  def update
    @user = current_user
    #@wikis = Wiki.visible_to(current_user)
    @wikis = policy_scope(Wiki)
    # check user params role can only be standard
    #if user_params[:role] != 'standard'
    #  user_params[:role] = 'standard'
    #end
    #if current_user.update_attributes(user_params)
    if current_user.update_attributes(user_params) && (:role == 'standard')
      @wikis.each do |wiki|
        wiki.private = false
      end
      flash[:notice] = "User information updated"
      redirect_to current_user
    elsif current_user.update_attributes(user_params)
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