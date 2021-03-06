class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by email: params[:session][:email].downcase
    if @user&.authenticate(params[:session][:password])
      log_in @user
      remember @user
      redirect_back_or :root
    else
      flash.now[:danger] = 'Invalid email/password'
      render :new
    end
  end

  def destroy
    log_out(current_user) if logged_in?
    redirect_to :root
  end
end
