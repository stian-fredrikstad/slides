class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_headers

  def set_headers
    response.headers["X-XSS-Protection"] = "0; mode=block"
  end
end
