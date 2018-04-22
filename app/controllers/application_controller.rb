class ApplicationController < ActionController::Base
http_basic_authenticate_with :name => ENV['BASIC_AUTH_USERNAME'], :password => ENV['BASIC_AUTH_PASSWORD'] if Rails.env == "staging"
  protect_from_forgery with: :exception
  include SessionsHelper

  private
    def logged_in_user
      unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url
      end
    end
end
