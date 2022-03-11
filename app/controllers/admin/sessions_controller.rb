class Admin::SessionsController < ApplicationController
  def new; end

  def create
    admin = Admin.find_by name: params[:name]
    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_posts_path, success: 'Welcome, Admin'
    else
      redirect_to new_admin_session_path, danger: 'Incorrect login and/or password'
    end
  end

  def destroy
    session.delete :admin_id
    redirect_to root_path, success: 'You are cuccesfuly logged out'
  end
end
