class Api::V1::SessionsController < ApplicationController
  def create
    # converted_params = JSON.parse(params.as_json.to_a[0][0].as_json)
    # @user = User.find_by_credentials(converted_params['user']['username'], converted_params['user']['password'])
    @user = User.find_by_credentials(params[:username], params[:password])
    if @user
      login(@user)
      render json: @user
      # render "api/v1/users/show"
    else
      render json: ["Invalid credentials"], status: 401
    end
  end

  def destroy
    @user = current_user
    if @user
      logout
      render json: ["You have logged out"], status: 200
    else
      render json: ["No user is signed in"], status: 404
    end
  end
end