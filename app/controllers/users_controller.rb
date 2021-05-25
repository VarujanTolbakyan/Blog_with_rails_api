class UsersController < ApplicationController
  before_action :authenticate!, except: [:login, :create] # Exclude this route from authentication
  before_action :set_user, except: [:login, :create]

  # GET /users/1
  def show
    render json: @user, scope: current_user
  end

  def login
    user = User.find_by(email: user_params[:email])

    if user&.password_is?(user_params[:password])
      render_json_auth_token(user_id: user.id)
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  # POST /users
  def create
    user = User.new(user_params)

    if user.save && user.password_is?(user_params[:password])
      render_json_auth_token(user_id: user.id)
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /users/1
  def update
    if @user.update(user_params)
      render json: @user, scope: current_user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    render json: { message: 'User successful deleted' }
  end

  private

  def render_json_auth_token(payload)
    auth_token = JsonWebToken.encode(payload)
    render json: { auth_token: auth_token }, status: :ok
  end

  def set_user
    @user = current_user
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
