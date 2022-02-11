class UsersController < ApplicationController
  
   def index
    @users = User.all
   end
   
   def account
    @user = current_user
   end
   
   def profile
    @user = current_user
   end
   
   def edit
    @user = current_user
   end
   
   def update
    @user = current_user
    @user.update(user_params)
    @user.update(profileimage: nil) if params[:image_delete].present? # 画像なしの場合に既存画像削除
    if @user.changed
    redirect_to root_path
    else
    redirect_to profile_path
    end
   end
   
   def user_params
    params.require(:user).permit(:name, :email, :profile, :profileimage, :encrypted_password)
   end
   
end