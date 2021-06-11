class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_displayable_string }.join("\n\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    response = "Hey, your new user is created with id #{new_user.id}"
    render plain: response
  end

  def login
    email = params[:email]
    password = params[:password]
    response = User.exists?(email: email, password: password)
    render plain: response
  end
end
