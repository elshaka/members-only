class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    def user_logged_in?
      unless logged_in?
        flash[:danger] = 'You must be logged in to perform that action'
        redirect_to :root
      end
    end
end
