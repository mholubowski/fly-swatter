class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def sign_in(user)
    cookies[:remember_token] = { value: user.remember_token,
                   expires: 2.weeks.from_now }
  end

  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def current_user=(user)
    @current_user = user
  end

end
