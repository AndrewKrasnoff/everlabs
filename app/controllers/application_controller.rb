class ApplicationController < ActionController::Base
  add_flash_types :success, :danger
  helper_method :logged_in?, :current_admin

  def current_admin
    @admin = Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def logged_in?
    !!current_admin
  end

  def authorized
    redirect_to new_admin_session_path unless logged_in?
  end

  def set_search
    @q=Recipe.search(params[:q])
  end

end
