class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = 'Account created successfully'
      redirect_to :root
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = 'Account updated successfully'
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = 'Account deleted successfully'
    redirect_to :root
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find params[:id]
    end
end
