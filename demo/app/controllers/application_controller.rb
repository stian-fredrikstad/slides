class ApplicationController < ActionController::Base
  before_filter :set_headers
  protect_from_forgery with: :exception

  def set_headers
    response.headers["X-XSS-Protection"] = "0; mode=block"
  end

  protected
  def authorize
    @current_user = User.where(name: session[:username], password: session[:password])
    unless @current_user.present?
      flash[:error] = "Unauthorized"
      return redirect_to session_login_path
    end
  end
end
