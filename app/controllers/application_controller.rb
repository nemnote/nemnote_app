class ApplicationController < ActionController::Base
http_basic_authenticate_with :name => ENV['BASIC_AUTH_USERNAME'], :password => ENV['BASIC_AUTH_PASSWORD'] if Rails.env == "staging"
  protect_from_forgery with: :exception
    def hello
        render html: "hello, world!"
    end
end
