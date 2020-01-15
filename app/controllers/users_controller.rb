class UsersController < ApplicationController
  before_action :user_logged_in?, except: [:new, :create]
  before_action :set_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = 'Account created successfully'
      redirect_to :root
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Account updated successfully'
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    log_out @user
    @user.destroy
    flash[:success] = 'Account deleted successfully'
    redirect_to :root
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user
      @user = current_user
    end
end
