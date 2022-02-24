class UsersController < ApplicationController
 
 before_action :move_to_signed_in
  
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
    if @user.update(user_params)
     flash[:notice] = "ユーザー情報を更新しました"
     redirect_to profile_path
    else
     redirect_to root_path
    end
   end
   
   def user_params
    params.require(:user).permit(:name, :email, :profile, :profileimage, :encrypted_password)
   end
   
   def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  '/users/sign_in'
    end
   end
   
end