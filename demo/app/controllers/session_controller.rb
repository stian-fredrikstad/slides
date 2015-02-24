class SessionController < ApplicationController

  def login

  end

  def create
    if User.where(name: params[:name], password: params[:password])
      session[:username] = params[:name]
      session[:password] = params[:password]
      redirect_to users_path
    else
      flash[:error] = "Failed to login"
      redirect_to login_path
    end
  end

  def logout
    session.destroy
    flash[:info] = "Logged out"
    redirect_to session_login_path
  end
end
