class ApplicationController < ActionController::Base
  before_action :basic_authentication

  private
  def basic_authentication
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
