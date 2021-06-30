class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def new
    render "users/new"
  end


  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password]
    )
    redirect_to  "/"
  end
end
