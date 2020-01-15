class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    def user_logged_in?
      unless logged_in?
        flash[:danger] = 'You must be logged in to perform that action'
        store_location
        redirect_to :login
      end
    end
end
