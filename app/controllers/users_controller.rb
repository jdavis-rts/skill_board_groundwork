class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # POST /login TODO real auth
  def login
    @user = User.find_by(username: login_params[:username])

    render json: @user

  rescue ActiveRecord::RecordNotFound
    render json: { message: "No user found for that username." }, status: 404
  end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])

    rescue ActiveRecord::RecordNotFound
        render json: { message: "No user found for that id." }, status: 404
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email_address, :job_title)
    end

    def login_params
      params.permit(:username)
    end
end
