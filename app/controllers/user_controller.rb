class UsersController < ApplicationController
 
   def update
     @user = current_user
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       redirect_to user_path(:id)
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_registration_path
     end
   end
 

   def show
    @user = current_user
    @items = @user.items
    @incomplete = @user.items.where(completed: false).count
   end

   private
 
   def user_params
     params.require(:user).permit(:name)
   end
end