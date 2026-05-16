class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new

    if save Views::Users::Form.new(@user)
      redirect_to @user, notice: "User was successfully created."
    else
      render Views::Users::New, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if save! Views::Users::Form.new(@user)
      redirect_to @user, notice: "User was successfully updated.", status: :see_other
    else
      render Views::Users::Edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
    redirect_to users_url, notice: "User was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
