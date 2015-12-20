class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery :except => :curl_post_request
  include SessionsHelper
  def hello
  	render text: "Testing Vitrium...."
  end
end