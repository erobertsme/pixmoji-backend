class AuthController < ApplicationController
  skip_before_action :authorized, only: [:login]
 
  def login
    @user = User.find_by(username: user_login_params[:username])

    if @user && @user.authenticate(user_login_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token, "left blank": "this spot intentionally left blank" }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end
 
  private
 
  def user_login_params
    params.require(:user).permit(:username, :password)
  end
end
