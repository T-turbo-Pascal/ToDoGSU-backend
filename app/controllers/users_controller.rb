class UsersController < ApplicationController
  include BCrypt
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}, status: 200
    else
      render json: {error: 'Invalid username or password'}, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}, status: 200
    else
      render json: {error: 'Invalid username or password'}, status: :unprocessable_entity
    end
  end




  def user_params
    p params
    params.require(:user).permit(:username, :password)
  end
end
